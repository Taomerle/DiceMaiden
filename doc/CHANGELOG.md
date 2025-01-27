## 9.2.0 - 01/14/2025
### Added
- Updated WoD command to support exploding dice

## 9.1.0 - 08-17-2024
### Added 
-  Exalted alias

## 9.0.6 - 07-04-2024
### Added
- Updated multi roll logic to support roll sets

## 9.0.5 - 07-02-2024
### Added
- Added additional info to the bot info command

## 9.0.4 - 06-29-2024
### Added
- Resolved an issue with wrath and glory difficulty rolls

## 9.0.3 - 06-27-2024
### Added
- Updated multi roll logic to use semi colons to break between roll sets.
  Resolves an issue with doing division commands

## 9.0.2 - 06-24-2024
### Added
- Resolved an issue where numbers in comments broke rolls
- Updated help commands

## 9.0.1 - 06-23-2024
### Added
- Resolved an issue with storypath alias rolls not exploding

## 9.0.0 - 06-23-2024
### Added
- Added support for rolling up to 4 unique dice rolls per command
- Fixed some bugs with Hero system hsk roll 

## 8.11.1 - 06-21-2024
### Added
- Fixed help rolls
- Fixed game system rolls

## 8.11.0 - 06-19-2024
### Added
- Added botch support

## 8.10.2 - 06-18-2024
### Added
- removed deprecated code that is no longer used due to slash commands

## 8.10.1 - 06-16-2024
### Added
- fix help rolls
- fix save roll

## 8.10.0 - 06-16-2024
### Added
- Hero system support
- no result modifier

## 8.9.0 - 06-15-2024
### Added
- Added dnd alias rolls for attack , skill checks and saving throws
- Added godbound dice roll system

## 8.8.1 - 04-07-2024
### Added
- Resolved an issue where reroll counts were not tallied accurately with multi dice roll

## 8.8.0 - 04-07-2024
### Added
- Added support for up to d1000 rolls
- Added support for private rolls(p cmd) e.g. /roll p 4d10

## 8.7.3 - 04-04-2024
### Added
- Updated D6 system alias to support single die rolls

## 8.7.2 - 04-03-2024
### Added
- Introduced logic to better handle poorly crafted dice rolls

## 8.7.1 - 03-28-2024
### Added
- Removed rest client API functionality

## 8.7.0 - 03-25-2024
### Added
- Refactored Gemfile
- Added total to roll set results
- Added note to readme regarding time it takes for a new server to be cached by discord

## 8.6.4 - 02-17-2024
### Added
- Refactored Gemfile
- Added base64 support

## 8.6.3 - 01-26-2024
### Added
- Refactored Gemfile 

## 8.6.2 - 01-24-2024
### Added
- Refactored sqlite usage
- Updated dockerfile to ruby 3.3.0
- Updated dockerfile to alpine linux 3.19

## 8.6.1 - 01-24-2024
### Added
- Minor changes to command text outputs

## 8.6.0 - 09-22-2023
### Added
- Resolved an issue where unsort comments would not work

## 8.5.2 - 07-13-2023
### Added
- Minor changes to donate and help text prompts

## 8.5.1 - 07-03-2023
### Added
- Resolved an issue related to display names in rolls

## 8.5.0 - 05-08-2023
### Added
- Added Earth Dawn 4th edition as well as additional steps for previous editions

## 8.4.0 - 12-18-2022
### Added
- Resolved an issue related to user names in direct messages to the bot

## 8.3.1 - 09-01-2022
### Added
- Removed ignoring heartbeat ack from discord API. No longer needed for stability

## 8.3.0 - 08-29-2022
### Added
- Changed formatting of dice response string. Format should now be Request -> Tally -> Result

## 8.2.2 - 08-25-2022
### Added
- Made roll message a requirement to improve the user experience

## 8.2.1 - 08-23-2022
### Added
- Added error reporting when dice roll message is empty

## 8.2.0 - 08-23-2022
### Added
- Resolved issue #148 related to single die dice rolls

## 8.1.0 - 08-23-2022
### Added
- Added first unit test file
- Added additional messaging for when purge commands are run

## 8.0.2 - 08-23-2022
### Added
- Refactored some code to further support slash commands

## 8.0.1 - 08-21-2022
### Added
- Resolved an issue with nickname checks for DMs. No longer going to check

## 8.0.0 - 08-21-2022
### Added
- Moved to slash commands per discord requirements. More info in readme!

## 7.2.0 - 12-19-2021
### Added
- Added alias support for general DnD stat rolls

## 7.1.1 - 10-16-2021
### Added
- Fixed an issue where the bot would read commands inside markdown blockquotes

## 7.1.0 - 09-09-2021
### Added
- Added support for threads

## 7.0.1 - 04-25-2021
### Added
- Resolved case sensitive issue from rubocop update

## 7.0.0 - 04-25-2021
### Added
- Added alias for Year Zero Engine
- Added rubocop rules and cleaned up the codebase

## 6.8.1 - 03-13-2021
### Added
- Resolved an issue where the bot would respond with "Invalid Form Body"

## 6.8.0 - 01-17-2021
### Added
- Added support for earthdawn system

## 6.7.0 - 01-17-2021
### Added
- Added initial support for storypath system
- Resolved an issue where the bot was responding to "!roll" even when a custom prefix was set.

## 6.6.1 - 10-17-2020
### Added
- Added alias for shorthand d100 rolls

## 6.6.0 - 09-17-2020
### Added
- Removed dice_maiden_lite.rb and consolidated its features into dice_maiden.rb
- Added 'lite' runtime support. If this is set, the bot will ignore database requirements

## 6.5.0 - 09-05-2020
### Added
- Added Shadowrun alias
- Added d6 System alias

## 6.4.0 - 08-07-2020
### Added
- Added Chronicles of Darkness alias
- Added Sunsails: New Millennium 4th edition alias

## 6.3.0 - 07-28-2020
### Added
- Added new text for rerolls. Results will now show total rerolls

## 6.2.1 - 07-23-2020
### Added
- Resolved an issue with keep lowest command. This now fully supports the drop command

## 6.2.0 - 06-22-2020
### Added
- Added support for indefinite explodes and rerolls. Check readme for more information!
- Updated world of darkness 4th edition alias. It now properly supports indefinite explosions.

## 6.1.0 - 06-08-2020
### Added
- Added new server wide option: Roll request display. You can set the bot to display the actual roll executed as part of the bots response.
- Resolved an issue with unsorting tally

## 6.0.1 - 05-28-2020
### Added
- The bot should now respond to private message rolls

## 6.0.0 - 05-19-2020
### Added
- Refactored the majority of bot logic to make it easier for multiple users to contribute to the code base

## 5.3.0 - 05-13-2020
## Added
- Fixed a bug where we were not properly checking the prefix

## 5.2.1 - 05-12-2020
## Added
- A laundry list of bug fixes for the recent prefix change support

## 5.0.0 - 05-12-2020
## Added
- Resolved an issue where roll sets would fail with single die rolls: !roll 5 d20
- Add prefix change support! Documentation updated with command syntax

## 4.3.0 - 05-08-2020
## Added
- Better error reporting for when roll is over discord character limit. The roll result will be resent in a simplified format

## 4.2.0 - 05-04-2020
## Added
- New unsort command syntax: !roll ul
- Refactored some command logic

## 4.1.0 - 04-24-2020
### Added
- Alias support for AGE system
- Typing indicator effect
- Listening status for roll command

## 4.0.6 - 04-17-2020
### Added
- Roll mechanic is now case-insensitive

## 4.0.5 - 04-12-2020
### Added
- Fixed bug with wrath and glory rolls
- Readded latency check feature

## 4.0.4 - 04-12-2020
### Added
- Better server count logging

## 4.0.3 - 04-10-2020
### Added
- Cleaned up ruby gems and discordbots API

## 4.0.2 - 04-07-2020
## Added
- Fixed an issue with d2 rolls

## 4.0.1 - 04-05-2020
### Added
- Moved shard count to env variable
- Removed check ping command
- Updated purge roll functionality

## 4.0.0 - 04-05-2020
### Added
- Add full math engine. Support for more advanced rolls!
- Removed check latency feature

## 3.4.0 - 03-28-2020
### Added
- Added support for game system Wrath and Glory

## 3.3.0 - 02-23-2020
### Added
- Added logging verbosity command 

## 3.2.2 - 01-14-2020
### Added
- Increaased server count means more shards required! Updated shard count

## 3.2.1 - 12-11-2019
### Added
- Fixed an issue with unsort command that would cause the tally to contain a zero value

## 3.2.0 - 11-08-2019
### Added
- Fixed an issue where roll set value can sometimes be set incorrectly
- Fixed an issue where the server may roll multiple instances of the same roll
- Add support for unsorting rolls! Check readme for more information

## 3.1.2 - 11-03-2019
### Added
- 26k servers using the bot! Increased shard capacity to support them 

## 3.1.0 - 09-05-2019
### Added
- Added donation information to help command 
- Added !roll donate command

## 3.0.0 - 08-18-2019
### Added
- Forked dice-bag gem. Added support for keeping lowest dice rolls
- Changed min dice roll from d3 to d2.

## 2.9.0 - 06-10-2019
### Added
- Ability to simplify ouput by not reporting the tally. More info in README

## 2.8.1 - 05-21-2019
### Added
- Filtered low dice rolls to prevent abuse

## 2.7.0 - 03-22-2019
### Added
- Support for nicknames
- Additional sharding

## 2.6.0 - 02-02-2019
### Added
- Bulk rolling ability added

## 2.5.3 - 01-26-2019
### Added
- Restricted purge rolls to manage_messages permissions

## 2.5.1 - 01-22-2019
### Added
- Additional sharding

## 2.5.0 - 01-07-2019
### Added
- sqlite3 support for logging
- Additional sharding
- Tweaks to roll error checking

## 2.4.0 - 01-02-2019
### Added
- Initial support for sharding

## 2.3.0 - 11-18-2019
### Added
- bot-info command

## 2.2.0 - 11-17-2018
### Added
- Additional logging

## 2.1.3 - 11-14-2018
### Added
- Refactored server count

## 2.1.2 - 09-29-2018
### Added
- Minor formatting tweaks

## 2.1.1 - 09-28-2018
### Added
- More refactoring: moved most functions to methods

## 2.1.0 - 09-28-2018
### Added
- Lots of refactoring

## 2.0.2 - 09-26-2018
### Added
- Added support for difficulty number

## 2.0.1 - 09-25-2018
### Added
- Added initial support for Wrath and Glory

## 2.0.0 - 08-28-2018
### Added
- Cleaned up formatting and refactored code

## 1.4.0 - 08-28-2018
### Added
- Added support for "Wrath and Glory" Wrath dice

## 1.3.1 - 08-01-2018
### Added
- Updated righteous fury pop to be for personal server only

## 1.3.0 - 07-25-2018
### Added
- Added ping command to check round trip latency

## 1.2.4 - 06-28-2018
### Added
- Added check for size of dice pools

## 1.2.3 - 06-27-2018
### Added
- Added support for large dice pools

## 1.2.2 - 06-27-2018
### Added
- Fixed issue with comments not supporting additional !

## 1.2.1 - 06-18-2018
### Added
- Updated comment command from # to !

## 1.2.0 - 06-07-2018
### Added
- Added comment command

## 1.1.0 - 12-16-2017
### Added
- Added purge command. **NOTE:** This may require re-adding the bot to your discord server due to a permission change.

## 1.0.3 - 12-11-2017
### Added
- Support for exception handling

## 1.0.2 - 11-28-2017
### Added
- Changed log file name
- Support for logging server lists

## 1.0.1 - 11-17-2017
### Added
- Published source code
- Updated regex syntaxes
- Updated tally functionality
- Updated help information

## 1.0.0 - 11-13-2017
### Added
- Initial release
