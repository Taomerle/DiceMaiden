# Dice bot for Discord
# Author: Humblemonk
# Version: 9.2.0
# Copyright (c) 2017. All rights reserved.
# !/usr/bin/ruby
# If you wish to run a single instance of this bot, please follow the "Manual Install" section of the readme!
require_relative 'src/dice_maiden_logic'
require_relative 'src/earthdawn_logic'
require_relative 'src/respond_logic'

require 'discordrb'
require 'dicebag'
require 'dotenv'
require 'get_process_mem'

Dotenv.load
@total_shards = ENV['SHARD'].to_i
# Add API token
@bot = Discordrb::Commands::CommandBot.new token: ENV['TOKEN'], num_shards: @total_shards, shard_id: ARGV[0].to_i,
                                           intents: %i[servers], ignore_bots: true, fancy_log: true
@shard = ARGV[0].to_i
@launch_option = ARGV[1].to_s
@prefix = ''
@check = ''

# open connection to sqlite db and set timeout to 10s if the database is busy
if @launch_option == 'lite'
  puts 'Dice Maiden lite mode detected!'
else
  require 'sqlite3'
  $db = SQLite3::Database.new 'main.db'
  $db.busy_timeout = (10_000)
end

mutex = Mutex.new

if @shard == 0
  puts "Shard #{@shard} is registering commands"
  @bot.register_application_command(:roll, 'Ask Dice Maiden to roll some dice!') do |cmd|
    cmd.string('message', 'roll syntax sent to Dice Maiden. Type help or visit github to view possible commands', required: true)
  end

  @bot.register_application_command(:r, 'Ask Dice Maiden to roll some dice!') do |cmd|
    cmd.string('message', 'roll syntax sent to Dice Maiden. Type help or visit github to view possible commands', required: true)
  end

  # log the command id for the above commands
  @bot.get_application_commands.map(&:id).each do |id|
    puts id
  end
end

inc_cmd = lambda do |event|
  # Locking the thread to prevent messages going to the wrong server
  mutex.lock
  @response_array = []
  begin
    inc_event_roll = event.options.values.join('')
    rolls_array = inc_event_roll.split(/\s*;\s*/).take(4)
    rolls_array.each do |event_roll|
      @do_tally_shuffle = false
      check_comment(event_roll)
      # grab roll request after we remove the comment section
      @roll_request = @parsed_event_roll.dup

      @input = alias_input_pass(@parsed_event_roll) # Do alias pass as soon as we get the message
      @simple_output = false
      @wng = false
      @dh = false
      @godbound = false
      @ed = false
      @hsn = false
      @hsk = false
      @hsh = false
      @no_result = false

      @private_roll = false
      @reroll_check = 0
      @reroll_indefinite_check = 0
      @reroll_count = 0
      @botch = 0
      @dnum = ''

      check_roll_modes
      next if @ed && !replace_earthdawn(event)

      @roll_set = nil
      next unless roll_sets_valid(event)

      # check for single dice rolls
      @input.gsub!(%r{(?<!\d)(^|[+*/-]\s?)d(\d+)}, '\11d\2') if @input.match?(%r{(?<!\d)(^|[+*/-]\s?)d(\d+)})

      @roll = @input
      @check = @prefix + @roll
      @test_status = ''
      # check user
      check_user_or_nick(event)
      # check for empty roll
      if @parsed_event_roll.empty?
        event.respond(content: "#{@user} roll is empty! Please type a complete dice roll message")
        next
      end
      # check for modifiers that should apply to everything
      check_universal_modifiers

      # Check for dn
      @dnum = @input.scan(/dn\s?(\d+)/).first.join.to_i if @input.match?(/^\s?(dn)\d+/i)

      # Check for correct input
      if @roll.match?(/\dd\d/i)
        event.channel.start_typing
        next if check_roll(event) == true

        # Check for wrath roll
        check_wrath
        # Grab dice roll, create roll, grab results
        if @roll_set.nil?
          next if do_roll(event) == true
        else
          @roll_set_results = ''
          @error_check_roll_set = ''
          roll_count = 0
          @roll_set_total = 0
          error_encountered = false
          while roll_count < @roll_set.to_i
            if do_roll(event) == true
              error_encountered = true
              break
            end
            @tally = alias_output_pass(@tally)
            if @simple_output == true
              @roll_set_results << "#{@dice_result}\n"
            else
              @error_check_roll_set << "#{@dice_result}\n"
              @roll_set_results << "`#{@tally}` #{@dice_result}\n"
            end
            roll_count += 1
          end
          next if error_encountered
        end

        log_roll(event) if @launch_option == 'debug'

        # Output aliasing
        @tally = alias_output_pass(@tally)

        # Does calculation for Hero System stuff, if necessary
        hero_system_math if @hsn || @hsk

        # Grab event user name, server name and timestamp for roll and log it
        log_roll(event) if @launch_option == 'debug'

        @has_comment = !@comment.to_s.empty? && !@comment.to_s.nil?

        @response_array.push(build_response)
      end
      next if check_donate(event) == true
      next if check_help(event) == true
      next if check_bot_info(event) == true
      next if check_purge(event) == false
    rescue StandardError => e ## The worst that should happen is that we catch the error and return its message.
      e.message = 'NIL MESSAGE!' if e.message.nil?
      # Simplify roll and send it again if we error out due to character limit
      if (e.message.include? 'Message over the character limit') || (e.message.include? 'Invalid Form Body')
        if @roll_set.nil?
          event.respond(content: "#{@user} Roll #{@dice_result} Reason: `Simplified roll due to character limit`")
        else
          event.respond(content: "#{@user} Rolls:\n#{@error_check_roll_set}Reason: `Simplified roll due to character limit`")
        end
      elsif (e.message.include? "undefined method `join' for nil:NilClass") || (e.message.include? "The bot doesn't have the required permission to do this!") || (e.message.include? '500: Internal Server Error') || (e.message.include? '500 Internal Server Error')
        time = Time.now.getutc
        File.open('dice_rolls.log', 'a') { |f| f.puts "#{time} ERROR: #{e.message}" }
      else
        event.respond(content: ('Unexpected exception thrown! (' + e.message + ")\n\nPlease drop us a message in the #support channel on the dice maiden server, or create an issue on Github."))
      end
    end
  end
  send_response(event)
  mutex.unlock
end

@bot.application_command(:roll, &inc_cmd)
@bot.application_command(:r, &inc_cmd)

if @launch_option == 'lite'
  @bot.run
else
  @bot.run :async

  # Sleep until bot is ready and then set listening status
  sleep(1) until @bot.ready
  @bot.update_status('online', '/roll', nil, since = 0, afk = false, activity_type = 2)
  # Check every 5 minutes and log server count
  loop do
    sleep 300
    time = Time.now.getutc
    if @bot.connected? == true
      server_parse = @bot.servers.count
      mem = GetProcessMem.new
      $db.execute "update shard_stats set server_count= #{server_parse}, mem = #{mem.mb}, timestamp = CURRENT_TIMESTAMP where shard_id = #{@shard}"
      File.open('dice_rolls.log', 'a') { |f| f.puts "#{time} Shard: #{@shard} Server Count: #{server_parse} Memory: #{mem.mb}" }
    else
      $db.execute "update shard_stats set server_count = 0, mem = 0, timestamp = CURRENT_TIMESTAMP where shard_id = #{@shard}"
      File.open('dice_rolls.log', 'a') { |f| f.puts "#{time} Shard: #{@shard} bot not ready!" }
      # Bot died and cant connect to Discord. Kill the bot and have eye restart it
      exit!
    end
  end
end
