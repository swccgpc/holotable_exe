Holotable version 0.9.10/Holodeck version 0.4.0
Copyright 2004-2019 Matt Moseley

*************
Installation:
*************

Use the installer to put Holotable in whatever directory you like.  You will not be 
able to see card images in either Holotable or Holodeck until the image root 
directory is set correctly in the holotable.ini initialization file, which should be 
taken care of by the installer.

If you want to, create a shortcut on your desktop.  On Windows, you
would right click on Holotable.exe and select "Create Shortcut" and 
move it to your desktop or select "Send to" and then 
"Desktop (create shortcut)".

Install the GTK+ runtime if you don't already have it (you need at 
least minor version 2.12).  A Windows port can be downloaded at 

http://www.holotable.com/download/downloads/gtk-2.12.9-win32-2.exe

Install that and everything should be happy.


******
Decks:
******

Holodeck is what you should use for building decks.  It has updated CDFs that are
compatible with the images you can download from The Holotable website.  It also 
removes problems with special characters that can crash Holotable.  As of version 
0.1.1, you can edit previously-saved decks.  Several problems related to saving 
decks are now fixed, and there is a counter for the number of cards in the deck.

Version 0.1.2 added the ability to "zoom" images just like Holotable, and the three 
key areas of the window can be resized through the use of panes (like the hand area 
in Holotable).  There is also a fix for crashes caused by pressing keys when the 
focus was in the list of cards from which to select or the deck list.  Now pressing 
'a' in either place is analogous to pressing the "Add card" button.  When the focus 
is in the deck list, pressing 'd' will remove one copy of the selected card, and the 
up and down arrow keys move a card up and down (respectively) in the deck order.

Version 0.1.3 was a bugfix release that removed a problem where Holodeck would crash 
if you opened it and then tried to load a deck before opening a CDF file.

Version 0.1.4 changed several things regarding key bindings.  The list of cards to 
add to your deck may now be navigated by pressing letters and numbers; if one exists, 
the first card that starts with the same letter or number will automatically be 
selected.  Also, the up and down arrow keys now change the selection in either list 
(previously they moved a card up or down in the deck list and had no effect in 
the list of cards from which to choose).

Version 0.1.5 fixed a bug where, if the cursor was left over the small image 
preview as the selected card was changed, the resulting popups would never go away. 
It also changed the order cards are added to the deck list; now, cards are prepended 
to the list, so cards added first (usually starting cards) end up at the bottom of 
the list. This way starting cards will be at the top of the deck when loaded in Holotable.

Version 0.2.0 made some much-needed improvements.  The ability to filter by card set 
was added (it had been disabled since 0.1.0 a year before), and a basic search 
capability was added.  Also, the card type can now be set to "all" so that cards of all 
types can be shown when doing a search, etc.  The ability to export the deck as a plain 
.txt file listing of the cards was also added.

Version 0.2.1 added the ability to specify cards as "starting"; this causes them to be 
loaded into the starting cards pile in Holotable.  Also, the average destiny of the 
deck (without starting cards) can be calculated, and opening draws may be simulated 
as well (also without starting cards).  Finally, you can also select destiny as a 
search criterion.

Version 0.3.0 improved the search capabilities by separating the lore and gametext search 
criteria and adding search of the icons text.  Also, the comparison operators =, >=, <=, 
and != can be used for searching destiny, deploy, forfeit, power, ability, armor, maneuver, 
defense value, hyperspeed, and landspeed.

Version 0.3.1 fixed a memory leak that occurred when using the large image popup 
feature.  Also, advanced or basic search can be selected; basic search provides much fewer 
options, but also makes the Holodeck window smaller.  Ctrl-F activates the Search button, 
and Ctrl-C activates the clear button.  Repeatedly pressing a letter or number key while 
focus is in the "cards to choose from" list will advance the selection to the next card 
that starts with that letter or number.  A "Card Type" column was added to the "cards to 
choose from" list.

Version 0.3.2 added the ability to search through the "cards to choose from" list by 
putting the focus in the list and then typing the letters in the card name you're looking 
for.  The list will be searched as you enter the letters in the name up until no cards 
match the name; the search string is reset to nothing when a card is added to your deck, 
when the card selection is changed by clicking with the mouse or using the up/down arrow 
keys, when the list loses focus, or when the Escape key is pressed.  Additionally, a 
separate window that contains the deck list with sortable columns is available, and a card 
summary dialog was added (open it to see the current count of cards of different types).  
Finally, you can change the order of cards in the deck by holding Control and pressing the 
up/down arrow keys -- this should speed reordering the deck).

Version 0.3.3 changed the .htd deck file format to version 2, which does not store card 
text in the deck file.  The card text is read from the CDF files, both in Holodeck and 
Holotable.  This allows deck files to be kept up to date (with errata and error corrections) 
just by getting updated CDF files.  Any old style deck files will be converted to use the 
new format if they are loaded and then saved.  Note that cards that have changed name (as a 
result of the Virtual Card Revolution, etc.) will not be able to be converted automatically.  
These must be removed manually and have the new card name added back.  Holodeck will try to 
indicate cards that no longer exist in the CDF and should be removed.  The basic search 
format is now the default window configuration.  Several "generic" card types are now 
available for the type filter -- so now you can filter by any character, rather than just 
Rebels, etc.  The deck list is now sortable by any column (previously availabe through a 
separate window accessible through a menu item).  If you try to change the order of any 
card in the deck, the view will revert to the deck order view (removing any sorting).  The 
average destiny of the non-starting cards in the deck is always shown on the main window.

Version 0.3.4 added the ability to generate randomized decks (with the card pool selectable 
by set).  A problem where starting cards in old deck files were not recognized was fixed.

Version 0.3.5 fixed a problem where Holodeck would crash if cards were added to a deck while 
the sort order on the deck was not the default.  Exporting a deck list to a text file now 
uses the current sort order of the deck.  When sorted by set or card type, headers are 
placed in the file indicating the set or card type, respectively, for the group of cards 
that follow.  There is a new menu item to allow the user to export the deck list to a 
directory and filename of their choosing.

Version 0.3.6 fixed a problem with the deck list becoming unsorted when a card is newly 
added to the deck.  Made image popup work more consistently when the card selection 
changes.

Version 0.3.7 fixed a problem where the number of starting cards was zeroed when a deck was 
loaded from a previously-existing deck file.  Keys to increment and decrement the number of 
copies (of the currently-selected card in the deck list) marked as starting were added ('s' 
and 'r', respectively).  The "average destiny" menu item was changed to give general destiny 
information; it now provides the number of non-starting cards of each destiny value (0-7 and 
other).

Version 0.3.8 added the ability to select multiple cards from the deck list to manipulate at 
once.  This allows adding extra copies, changing the number of copies of each that are marked 
starting, and deleting copies of the selected cards.

Version 0.3.9 fixed a problem with crashes when adding a new card to a deck when the deck 
list was sorted by name.

Version 0.4.0 supported hiding/showing virtual cards removed by the reset (legacy format).


****************************
Keyboard and mouse commands:
****************************

Click on a card and drag to move it.  To move a whole stack 
(all cards that overlap with the one you click on, plus the 
ones that overlap with those, etc.), press Control, then 
click and drag (you can release control at any time during 
the drag).  You can select in Table->Options whether you want 
single cards and stacks to move as you drag or not.

** Note: As of Holotable 0.7.4, key bindings are configurable.  These list the defaults. **
**       You may generate/overwrite a default key bindings file in the Options dialog    **
**       under the Initialization tab.                                                   **

Flip Card: f or right mouse button (when context menus not being used)
Flip Stack: Control-f or Control-right mouse button (when context menus not being used)
Next card in stack: n
Previous card in stack: p
Straighten stack: c
Shuffle stack: Shift-s (S)
Tally cards in stack: t
Horizontal Fan: h
Vertical Fan: g
Make flip state consistent: y

Activate Force: a
Used Force: u
Draw from Force Pile: d
Draw from bottom of Force Pile: ?
Draw from Reserve Deck: w
Draw from bottom of Reserve Deck: /
Recirculate Used Pile: Shift-e (E)
Lose Force from Reserve Deck: l (lowercase L)
Retrieve from Lost Pile: x
Search Reserve Deck: 1 (subject to opponent's approval, if connected)
Search starting cards: 2 (subject to opponent's approval, if connected)
Search Force Pile: 3 (subject to opponent's approval, if connected)
Search Used Pile: 4 (subject to opponent's approval, if connected)
Search Lost Pile: 5 (subject to opponent's approval, if connected)
Peek at top X cards: 6
Swap hand card(s) with one from Lost Pile: 7
Draw destiny: b
Move top card of Reserve Deck to Used Pile (facedown): B
Move card to bottom of Used Pile (facedown): .
Move card to top of Used Pile (facedown): >
Move card to bottom of starting cards pile: ,
Verify pile (also hand): V

Add card to group: left click on card, then hold Shift and left click on group
Delete card from group: 9
Delete all cards from group: 8
Reposition group: 0

Rotate Card Right: r
Rotate Stack Right: Control-r
Rotate Card Left: Shift-r (R)
Rotate Stack Left: Control-Shift-r (Control-R)
Rotate Card 180 degrees: ]
Rotate Stack 180 degrees: Control-]
Rotate large image 180 degrees: [

'Use' card: q
'Deploy' card: '
'Target' card: m
Force drain: -
Lose Force to card: =
Initiate battle at location: \
Toggle hand visibility: v
Swap sides (single player only): Q
Toggle popup type: `

Quick text responses 1-8: F1-F8

NOTE: If you need to look through a deck, going backwards 
      using 'p' will be faster than 'n'.


****************
Menu selections:
****************

File->Load deck... - loads a deck into your hand.  Any cards marked as 
                     starting are loaded to the starting cards pile.
File->Load game... - loads a saved game.  For two-player games, your 
                     opponent must enter the correct password for the 
                     load to succeed.
File->Save game... - saves card information to a file, auto-
                     matically appending ".htg" if there is no file 
                     extension specified.  Table size and pile 
                     positions are saved as well.  There must be 
                     at least one card loaded in order to save a 
                     game.
File->Check for updates - Checks the Internet to determine if the 
                          latest version of Holotable has been 
                          installed.  Also checks for CDF and image file 
                          updates and gives the user the option to 
                          automatically download and install them.
File->Quit - exits Holotable.

Table->Undo - undoes the last card movement.
Table->Redo - redoes the last movement that was undone.
Table->Clear local cards - removes all local cards from your hand, the 
                          table, and the opponent's hand.
Table->Clear all cards - removes all cards from your hand, the table, 
                        and the opponent's hand (use this wisely, as
                        your opponent may not play with you again if
                        you do it when you're losing!).
Table->Options... - set up various Holotable options (including 
                    image root directory and default deck directory - 
                    the image root directory must be set correctly, or 
                    you won't be able to see card images).
Table->Command Window... - opens a window where you can use buttons to 
                           accomplish all pile movement actions and 
                           searches as well as swap sides
Table->Detach chat/log window - removes the chat/log window from the area 
                                next to the hand and puts it in a 
                                separate window
Table->Detach hand window - removes the hand window from the area next 
                            to the chat/log and puts it in a separate 
                            window
Table->Hide phase/turn and status bars - hides the bottom two bars in 
                                         order to provide more table 
                                         visibility
Table->Choose side - randomly chooses Light or Dark Side and indicates this 
                     by a chat message to your opponent

Server->Connect - connect to a server to play a game.  Connects 
                  to the IP/hostname and port set in the 
                  Options dialog.
Server->Accept - set up your machine as a server for a peer to 
                 peer connection from another player.  Listens 
                 on the port specified in the Options dialog.
                 (You may not be able to accept connections 
                 depending on your network configuration).
Server->Disconnect - disconnect from a server you've connected to.
Server->Cancel Accept - stop listening for a peer to peer 
                        connection.
Server->End Game - if you are playing via the central server, you 
                   can end your game and return to the lobby 
                   without disconnecting and reconnecting.  Your 
                   opponent will be returned there as well.  When 
                   observing a game, this takes only you back to 
                   the central server lobby.

Help->Key reference... - Open a keyboard reference dialog, which will 
                         stay above other windows.
Help->About - list some information about Holotable.


***************
Playing a game:
***************

Once you've found someone to play against, you need to get connected.

Peer to peer:
One player choose Server->Accept, and the other player sets the first 
player's IP address and port number in their options.  The second 
player then chooses Server->Connect.  Note that, depending on your 
network configuration, you may not be able to accept incoming 
connections.  Firewall software must be configured to allow incoming 
connections to Holotable ("act as a server"); routers generally need 
to be configured to allow incoming traffic on the port number you 
are trying to use, and they may need to be set to do port forwarding.

Central server (www.holotable.com):
Both players put the central server's IP address/hostname and port number 5320 
in their options.  Both players then choose Server->Connect.  This 
will connect to the central server, which requires authentication.  
You must enter the password associated with your account on the Holotable
website forums (your username in Table->Options must also match the 
username from the forum account).  After you've entered the correct 
password, you will see the server lobby.  You can chat with other users 
and request games here.  If you request a game from yourself, you will 
automatically be rejected.  Any user you request a game with will see 
a dialog box that allows them to accept or reject the game.  If they 
accept, you will see a message in the status bar area reflecting 
that, and the server lobby dialog will disappear.  You can then load 
your decks and start playing.

Once there is a connection, both players should load their decks (it is
EXTREMELY important that this be done AFTER the connection is made, and
that no cards were on either player's table beforehand).  Wait for one 
person's deck to load before loading the other deck.  The status bar on 
the right should report details about the connection, including how many 
remote cards have been loaded.  Once decks are loaded, go ahead and play!

Your opponent's cards will show up rotated 180 degrees from their view, 
just like if you were sitting across the table from them.  Their cards 
will also be on the other side of the table.  So when you play your 
cards on the "bottom" of the table, they show up to your opponent at 
the top.  It is important that both of you have the same dimensions 
set for the playing surface size.  Otherwise the one with the smaller 
dimension might end up with cards all stacked on each other that 
shouldn't be.  The default option to auto-adjust the table size to the 
largest dimensions will take care of this for you if both players have 
it turned on when a game is started.


*******************************
Central server lobby operation:
*******************************

The central server lobby provides a place for players to meet and chat 
as well as find opponents for games.  When you log on to the server, 
a window will appear that shows you the username, status, and location 
of everyone who is currently online.  The number of people currently 
playing a game is shown; if you place your mouse cursor over that text, 
a tooltip will appear that shows the names of these players.

In the middle of the window is a combo box with various status choices.  
You may use these options to indicate what you are doing in the lobby.  
If you choose "Away", anyone who requests a game from you will 
automatically be rejected, and you will not see the request.

To request a game with someone, select their username in the list and 
click the "Request game" button.  That user will see a dialog box pop 
up which will give them the option of accepting or rejecting your 
request.  If your request is accepted, the server lobby window will 
disappear and you will be placed back in the main Holotable window, 
where you can load decks and start your game.  If the request is 
rejected, a message indicating that will appear in your chat/log 
window on the main Holotable screen.  Note that requests are also 
automatically rejected if the other user has their own game request 
pending, someone else has already requested a game from them and they 
have yet to respond, or the user has configured Holotable to ignore you.

The central server can record rated game information.  This allows players 
to track their ability against others.  To play a rated game, change your 
status in the lobby to "Rated game" and request a game from someone.  If 
they accept, the game result will be recorded when you go back to the 
lobby after the game.

The "Observation" button opens a dialog containing a list of the current 
games in progress.  You may select one of the games in the list and 
click the button to request observation of that game.  The players will 
see your request and have the choice to accept or reject it.  If either 
player rejects your request, you will be notified and you will stay in 
the lobby.  If both players accept it, the lobby dialog will go away and 
the game will load for you.  Each player's name will appear by their 
Reserve Deck for a short period.  You will be able to chat with the 
players and any other observers, but you cannot manipulate the cards or 
see anyone's hand.  Either player may kick you out at any time, and you 
will return to the lobby.  If you are done watching the game, you can 
select "End game" from the Server menu to go back to the lobby.

In order to provide a way to avoid harassment of various sorts that was 
previously possible, you may set up a list of users to ignore while on 
the central server.  You will still see the user in the user list, but 
you will not see any of their chat messages sent to the lobby or any 
of their game requests (which will automatically be rejected).  You 
may set up your list by clicking the 'Ignore list' button while 
logged onto the central server.  If a user is selected in the user 
list area, the entry field will be prepopulated with that name when the 
dialog opens.  You may choose to ignore a user permanently, in which 
case the user will always be in your ignore list until you delete them.  
If you ignore a user without choosing the permanent option, the user 
will only be ignored until you close Holotable.

You may whisper to a user by selecting the checkbox and choosing a user 
in the combo box.  When you whisper, only you and the other user will 
see the message (it will be indicated by a "[whispered to <user>]" tag 
prepended to the message).


*************************
Quick end turn indicator:
*************************

In Holotable 0.8.3 a new feature was introduced to make indicating the end 
of turns easier.  The area between the "Ready for phase change" button and 
the "Pause game" button initially has "My turn" in it.  When a game is 
started, the user who clicks in this area first will have the area turn 
green with "End turn" text in it.  The other user will see the area turn 
red with "Opponent's turn" in it.  When the first user clicks in the area at 
the end of their turn, the appearances will switch.  This is a simple way to 
indicate the end of your turn without having to type something in the chat 
area repetitively or use the specific phase change buttons (which are 
cumbersome for some uses).


********************************
Setting quick chat text choices:
********************************

The quick chat text combo box contents may be customized by creating a file 
called 'quicktext.dat' in your Holotable installation directory.  Each line 
in the file will appear in the combo box as a quick chat text option.  Once 
Holotable has been restarted, the quick chat text combo box will show your 
customized choices.


*******************************
Setting default pile positions:
*******************************

The holotable.ini file is written with the positions of the different 
piles each time the options are saved.  If you upgraded to Holotable 
0.4.1, your holotable.ini can be updated with the default settings by 
opening the options dialog and choosing "Apply" or "OK".  You can then 
open holotable.ini and edit the default positions for the piles.

For each pile, there are X and Y offsets.  The first value is the X 
offset, which determines how far from either edge of the playing 
surface the particular pile is placed.  The second value is the 
Y offset, which is always from the bottom of the playing surface.
Some players are used to having their piles on their left, which is 
opposite of the default position.  To support anchoring the piles to the 
left side of the playing surface, you add "left" after the Y position
for each pile that you want anchored on the left.  Otherwise, each 
pile will be anchored to the right.

To aid in editing your holotable.ini for the particular placement you 
want, the size of the five vertical piles is 66x91 pixels.  The Used 
Pile, which is horizontal, is 91x66 pixels.


**************************
Changing chat text colors:
**************************

In order to make it easier to see which messages in the chat/log area 
are from what source, you can change the color used for each type of 
message.  Informational messages are shown in the color specified in 
the holotable.rc file.  Chat messages from you and your opponent may 
be shown in different colors.  The holotable.ini file keeps this 
information, and Holotable will write the default values (blue for 
you and red for your opponent) to the file each time the options are 
saved if none were in the file when Holotable started.

Colors may be specified by name (only the basics are supported) or 
in RGB format.  For RGB format, the values should be separated by 
spaces and be in the range 0 to 65535.

Example (these are the lines you'd add to/modify in your holotable.ini):

Your text: 3400 78 50000
Opponent's text: orange


********************
Card border feature:
********************

If you want your cards to have different borders based on card type, 
edit your "htborders.ini" file.  The format is

     <card type>: <red value> <green value> <blue value>

                            AND

     <card set>: <red value> <green value> <blue value>

(without the < and >) The colon is IMPORTANT!

Valid card type values are those that are used in your deck files.
For example, if you wanted all interrupts to have a certain color, 
you'd have this line in your htborders.ini file:

     Interrupt: <red> <green> <blue>

Valid set values are those used in your deck files.  You can also 
use subsets of these.  So you could make all your virtual cards 
have a certain color with

     Virtual: <red> <green> <blue>

There are two special keywords: OTHERS and NONE.  Using

     OTHERS: <red> <green> <blue>

will result in each card that doesn't match the other card types 
you specified colors for having this default border color.  You can 
also use NONE like this:

     <card type>: NONE
     
This will result in the specified card type having no border drawn 
for it.  In this case your cards will show up just like the images 
you have (i.e., with the black border from the card image).  You can 
combine OTHERS and NONE , but the effect is the same as just not 
doing so (no borders will be drawn for card types you didn't specify).

Valid color values are 0-255.  You can find charts online that tell 
you what color combinations result in what colors, or you can use 
most imaging programs to figure it out.


************************************
Changes/bugfixes for version 0.9.10:
************************************

updated to be able to get image updates from Github

************************************
Changes/bugfixes for version 0.9.9:
************************************

added shortcut keys for the first 8 quick chat text items
updated for virtual card reset

************************************
Changes/bugfixes for version 0.9.8:
************************************

fixed potential card order problem when using "card to top of Used Pile"
fixed card order problem with redoing a recirculation of the Used Pile
make local pile positions reset to default after ending a game

************************************
Changes/bugfixes for version 0.9.7:
************************************

added rated game capability

************************************
Changes/bugfixes for version 0.9.6:
************************************

changed observation requests to be non-modal in order to avoid lockup problems
added ability to exchange hand card(s) with one card from Lost Pile
fixed problem with cards being rotated incorrectly for observers on initial load

************************************
Changes/bugfixes for version 0.9.5:
************************************

added some auto-reject capabilities available when responding to observation requests
fixed a bug related to pile positioning
restored local pile positions after stopping observation of a game

************************************
Changes/bugfixes for version 0.9.4:
************************************

fixed some bugs that could cause crashes related to loading then clearing decks, then loading other decks
added observation capability (when using the central server)
corrected some bad messages about where cards were placed when moved out of opponent's hand onto table
allow user who purposefully disconnects/ends the game to be able to save the game (instead of 
  presenting the save dialog and then having the cards cleared off the table immediately)
user who is not loading a saved game now receives the same chat history text from the saved game that 
  the loader does

************************************
Changes/bugfixes for version 0.9.3:
************************************

fixed a bug where cards could "jump" around the table when certain command keys were pressed multiple times
fixed a bug that could result in crashes when a card group was deleted

************************************
Changes/bugfixes for version 0.9.2:
************************************

added a highlight function to the 'target' card command, so the opponent can 
  find the card more easily
added a brief popup containing the stack count for when the 'tally' command 
  is used; this is to make this command usable for people who have the 
  status bar hidden (where the stack count is normally displayed)
fixed a problem where opponent's manual card movement would not be listed
  in the chat area if it was done immediately after movement with command 
  keys/buttons
fixed a problem that lead to a crash when switching table sides (on Linux)
added ability to select multiple cards to take into hand when searching a pile


************************************
Changes/bugfixes for version 0.9.1:
************************************

added the , key to put a card underneath the starting cards pile
using the Control key with the fan command will, with successive presses, 
  cycle through the three fan spacings
fixed a problem where clicking on the table after opening a card context menu 
  (i.e., to close the context menu) would cause cards to "jump" around the table


************************************
Changes/bugfixes for version 0.9.0:
************************************

fixed a bug related to use of some card context menu items and cards moving around 
  without having been clicked on
added a graphic to show which pile a card was moved into
made pile peek function default to suppressing shuffle afterwards
fixed problem where the large image/tooltip text popup for a card would disappear 
  each time your opponent moved a card, etc.


***********************************
Changes/bugfixes for version 0.8.9:
***********************************

GTK+ 2.12 is now required
changed messages to display the card name when a single card is moved from 
  hand to table faceup
added destiny number(s) to pile search display & verification dialog
pile search display now shows card text in a tooltip when the cursor moves over each row
  (also for verify dialog)
changed tooltip mechanism for cards on table/in hand; it should work the same as before, 
  or maybe slightly better.  upgrading to GTK+ 2.12 broke the previous method of using 
  tooltips.
clear "disable command keys" when the command window is closed/hidden
removed the suppress shuffle checkbox from the verification dialog
added ability to view X number of cards from top of either Reserve Deck; when viewing 
  your own cards, you can select one to draw into hand and optionally suppress shuffling 
  of the Reserve Deck afterwards
store phase/turn/status bar hidden status in initialization file, so it will persist
pile placement is now configurable in the options dialog; it has always been configurable 
  through the holotable.ini file itself, but now it is easier to set


***********************************
Changes/bugfixes for version 0.8.8:
***********************************

fixed card name referenced by "lose Force to" command when using the back 
  side of a two-sided card
added option to hide status & progress bar and phase/turn/pause area
added option to allow hand area to be detached like chat/log window
added option to pile searches to suppress the shuffle that follows
added option to force table size auto-negotiation to go to smallest size; 
  auto-adjust must be done and the user only has an option between large & small


***********************************
Changes/bugfixes for version 0.8.7:
***********************************

automatic deck converter to compensate for virtual block changes to the 
  CDFs and image files


***********************************
Changes/bugfixes for version 0.8.6:
***********************************

fixed numerous potential jumping card problems that could occur
fixed crash associated with pile search & verify dialogs
fixed save game error that would cause a crash on loading


***********************************
Changes/bugfixes for version 0.8.5:
***********************************

added automatic image file updating capability (optional)
fixed bug where cards could move with cursor when not being dragged
  (particularly with GTK+ 2.12 and up)
made pile search dialog show cards in pile order (can be sorted in 
  alphabetical order by clicking column header)


***********************************
Changes/bugfixes for version 0.8.4:
***********************************

supports new deck file format and reads card text from CDFs
added automatic CDF version check and download/install (optional)
added automatic Holotable version check and download/install (optional)
changed key bindings dialog to be resizable and have scrollbars if needed


***********************************
Changes/bugfixes for version 0.8.3:
***********************************

added draw from bottom of Reserve Deck capability
added draw from bottom of Force Pile capability
added "lose Force to <card>" capability
added "initiate battle at <location>" capability
added "deploy <card>" capability
added move card to top of Used Pile capability
added ignore user for central server lobby (messages from listed users are not shown, game requests are automatically rejected)
added whisper to user for central server lobby
quick message list is user-configurable by text file
central server dialog has two panes so user can adjust size of user list and chat text area
changed "Pacific Rim" location to "Australia/New Zealand"
"coin flip" menu selection to choose which side to be
easier indication of whose turn it is
lowered network timeout warning to 1 minute from 5
central server user status support (having away status automatically rejects all game requests)
verify choice for all piles and hand (shows opponent list of cards in the selected area)
added "lose Force to card" and "initiate battle" to right click context menu
added enable/disable for card grouping feature


***********************************
Changes/bugfixes for version 0.8.2:
***********************************

fixed a bug where the search function would no longer work if the game was 
  interuppted while a search request was pending; it gets reset when a 
  disconnection occurs or when the user goes back to the lobby
added messages to tell both users when a card gets added to or deleted 
  from a group
cards are now automatically removed from their group when they are snapped 
  into a pile; this will prevent some unexpected results
added option to automatically check for latest program version and compare 
  to user's version
added automatic message to notify players when an objective is flipped 
  while on the table
added support for PNG images; search order is PNG -> GIF -> JPG


***********************************
Changes/bugfixes for version 0.8.1:
***********************************

fixed next/previous so they work multiple times in a stack without 
  having to move the mouse; also, image popups work as the stack is traversed
default save game filename is set based on username (plus opponent's name if 
  playing against someone), date, and time
saved games retain up to 100 lines' worth of text from the chat/log window
  (previously only saved up to 20 lines)
added a "Cancel" button to search request dialog that is the default; it does 
  nothing, and will prevent accidental responses to search requests when the 
  user is in the middle of typing at the time the dialog appears
added key to toggle popup type (large image/card text tooltip) on the fly so 
  text can be compared against the image (does not change the settings in the 
  options file, so your default will be preserved when using this key)
added support for Force draining, with a dialog box for entering the Force 
  drain amount for the location (automatically populated with the basic 
  amount) -- can be accessed through a key binding or the card context menu
fixed a bug where card movement (such as to/from a pile) could be reported 
  incorrectly
added capability to stop the central server dialog from popping to the top 
  whenever a chat message is received
added capability to disable key bindings for actions that can be done through 
  the command window buttons

***********************************
Changes/bugfixes for version 0.8.0:
***********************************

added country selection for display in central server
added detachable chat/log window
added more commands to context menu (target, use, tally)
added keepalive message to prevent networks from automatically closing 
  idle connections and to warn user when connection may be dead
fixed bug where key bindings other than the defaults for searching 
  piles would not work
added support for changing phases (coordinated between players)
added support for pausing the game
fixed bug where fanning a stack could allow cards to move outside the 
  table area
added hashing of password when sending to central server

***********************************
Changes/bugfixes for version 0.7.5:
***********************************

drawing destiny shows the card name drawn when advanced reporting is on
movement of cards in Force/Used Pile to/from Lost Pile is reported
username is limited to 25 characters instead of 20 (fixes a bug in reading holotable.ini)
added key binding for moving a card to bottom of Used Pile (from table or 
  hand)
font for pile counts is configurable through holotable.rc -- this makes it 
  possible for users to control the width of the Holotable window, which could 
  be forced to a large value when the default font is large (this occurs on Linux 
  frequently)

***********************************
Changes/bugfixes for version 0.7.4:
***********************************

fixed bug where several stack functions (fanning, next, etc.) would not 
  work in the hand
added user-definable key bindings (through the use of keybindings.ini).
  the key reference dialog updates based on the current settings.
  defaults can be restored through a button in the options dialog.
fixed bug where cards snapped to incorrect place for piles in saved games
  and when the piles have been moved by auto-adjusting or changing
  the table size

***********************************
Changes/bugfixes for version 0.7.3:
***********************************

fixed bug where moving a pile broke the swap sides feature
fixed bug where the view could be swapped with the "Swap sides" button
  on the command window when connected to an opponent
added prevention of using 'next', 'previous', and both fan types when
  the cursor is over a card in a pile; the first two things prevent 
  surreptitious cheating, and the last prevents accidentally getting
  things all messed up by fanning a stack that's in a pile
added the pile being searched to the title of the pile search dialog
added optional extra messages in the chat log which show you when the 
  opponent moves cards and flips them.  these messages tell you which 
  piles cards were moved to or from, what piles cards were flipped on,
  etc.
added ability to group and ungroup cards (this is sort of 
  preliminary, but it's good enough to use)
fixed bug where loading a single user game did not clear the table
  before the game was loaded

***********************************
Changes/bugfixes for version 0.7.2:
***********************************

fixed bug introduced in 0.7.1 where undoing regular card movement, fanning, or
  straightening often resulted in cards being flipped incorrectly
added ability to specify the gap between cards when fanned (small, medium, 
  or large)
added ability to "swap sides" when testing decks (i.e., not connected) to
  make playing against yourself easier
added a quick command bar to supplement key commands for dealing with pile
  movement, pile searches, and swapping sides
added capability to change focus by clicking on an empty area on the table or 
  in the hand area, which allows key commands to be used again after, for 
  example, having typed something in the chat text field
added ability to target a card by pressing the 'm' key (similar to 'using' a card)
added ability to save and load games when in single player mode; single player
  saved games will not load when connected to someone (and vice versa)

***********************************
Changes/bugfixes for version 0.7.1:
***********************************

added option (in Options dialog) to load cards to hand instead of Reserve
  deck (some users said they liked the old way)
added 'B' key to move cards from Reserve Deck to Used Pile and ensure
  they're facedown. this is mainly to ease the destiny drawing process.

***********************************
Changes/bugfixes for version 0.7.0:
***********************************

added ability to rotate popup image by 180 degrees (to ease reading of 
  opposite side of locations)
made undo of drawing a card from a pile with a pile search work 
  in all cases
made cards load to Reserve Deck instead of the hand (since cards can 
  be specified to load to the starting cards pile now)
made all card searches that succeed take the card into hand
made piles that were searched be automatically shuffled afterwards, even 
  when the search was canceled
saved games now save the last 20 lines of text in the chat window for 
  the person who saves the game; this will provide some context for 
  that person when the game is loaded again
added check for empty pile when a search request is made; if there are 
  no cards, the search is not requested from the opponent
made card search dialog and the related messages show the title from both 
  sides of the card when it is two-sided
added error reporting for when an uninterpretable message is 
  received (to help in debugging)
added undo capabilities to movement done with context menu and for straightening
  and fanning of stacks
added missing messages for shuffling of starting piles
prevented sending of undo/redo messages to the opponent when the movement 
  is in your hand area
improved undo/redo functionality for pulling a card from a pile after a search
  (a specific message about undoing/redoing the search is shown, and the card's 
  original flip state is restored when undoing)
added undo/redo for rotations and flipping
added "drawing" destiny and reporting of destiny drawn with 'b' key
fixed problem where large image popup could remain visible when the cursor
  is not over a card

***********************************
Changes/bugfixes for version 0.6.4:
***********************************

fixed a bug that sometimes caused a crash when using the 'q' key to 
  use a card
fixed a problem with selecting a user in the central server dialog
added ability to hide the card searched for in a pile from the 
  opponent; the card is put into your hand in this case, and the 
  opponent sees a message that the card was hidden from them
fixed a bug that sometimes caused a crash when drawing cards from 
  the Force Pile or Reserve Deck

***********************************
Changes/bugfixes for version 0.6.3:
***********************************

added authentication capability for using the central server
fixed bug related to server chat messages

***********************************
Changes/bugfixes for version 0.6.2:
***********************************

fixed bug where undoing Force retrieval moved the cards to the Reserve
  deck instead of the Lost Pile
fixed bug where undoing and then redoing a draw of cards into hand 
  (from Force Pile or Reserve Deck) caused the opponent to see the 
  cards still on the table and receive a warning message
made error reporting when a deck fails to load work better for the 
  opponent
added specific reporting of shuffling of the Force Pile, Reserve Deck, 
  Used Pile, and Lost Pile.  other shuffles just report that a 
  stack was shuffled (as before, except you get a message when you 
  shuffle a stack, instead of just your opponent seeing it)

***********************************
Changes/bugfixes for version 0.6.1:
***********************************

fixed bug where the opponent's Holotable crashed when the user 
  pressed 'q' (to 'use' a card) over a face-down card on the table
changed options so that they can be updated for the current session 
  even when the options file cannot be opened for saving them
piles are anchorable individually, instead of all one way
added version checking; notification if versions of players don't match
added undo and redo functionality (up to 64 individual actions) for 
  card movement, including all special pile movement
added search capability for Force Pile, Used Pile, and Lost Pile
added capability to load cards to the starting cards pile (for 
  Starting Effect and Defensive Shields, plus any Objective and 
  related cards that start on the table)
added capability to ensure that all cards in a stack are flipped the 
  same way. the cards are flipped so that they match the flip state 
  of the card the cursor is over
added some commonly-used messages in a listbox so they can be sent 
  quickly
fixed a crash caused by searching a pile for a card and pressing 
  the OK button without selecting a card


***********************************
Changes/bugfixes for version 0.6.0:
***********************************

fixed bug where Holotable crashed if the last card on the table was 
  drawn from the Force pile with the 'd' key
fixed limitation in pile movement reporting where movements were 
  incorrectly reported if the type of movement (draw, use, loss, etc.) 
  changed rapidly
added function to change pile count color temporarily when a pile 
  count changes (to help prevent cheating)
added an "acknowledge" button to cut down on needed typing
added a function to notify the opponent you are using a card by pressing 
  the 'q' key while the cursor is over it (to cut down on typing)
added starting cards and out of play piles
added capability to search Reserve Deck or starting cards pile (with 
  opponent approval when connected) by card name

***********************************
Changes/bugfixes for version 0.5.5:
***********************************

fixed a bug where cards would move to incorrect locations for the opponent 
  when rotated

***********************************
Changes/bugfixes for version 0.5.4:
***********************************

added the capability to use context menus to do some actions for cards/stacks
a few other minor fixes

***********************************
Changes/bugfixes for version 0.5.3:
***********************************

made card movement messages more reliable
fixed numerous bugs related to the save game dialog
various minor fixes and improvements

***********************************
Changes/bugfixes for version 0.5.2:
***********************************

added code to prevent the "jumping piles" problem some people experienced
number of players playing a game on the central server is shown in 
  the central server chat/opponent selection dialog.  opponents are 
  shown together in the tooltip for the number of people playing a game 
  text label
fixed a bug where cards with broken images could not be rotated

***********************************
Changes/bugfixes for version 0.5.1:
***********************************

fixed problem where sometimes recirculation would not move Used Pile 
  cards to the bottom of the Reserve Deck for the opponent
added intelligent reporting of activation, Force use, drawing cards 
  from Reserve Deck, etc. in the chat area for both players (only 
  when the key commands are used)
decks load faster
updated server IP so that "Restore Defaults" works correctly

***********************************
Changes/bugfixes for version 0.5.0:
***********************************

added load/save game functionality, with password protection
saved games restore table size and pile positions
fixed some memory leaks and bugs that could cause crashes
fixed problem where tooltip text would not pop up if image 'zoom' 
  was selected and the large image could not be found
added support for .jpg images for cards (used if .gif not found)
incorporated Linux support
opponent's decks load faster
fixed problem where pile placement would not be sent if playing 
  over the central server and a second game was started after 
  using "End Game" to end the first one
made table autosizing & pile positioning work better
removed logging (obsolete and could allow cheating)
added a few more informational messages
added some code to aid in tailoring Holotable's look to user 
  preferences
shuffling a stack no longer locks the program for a 
  short period of time
fixed bug where opponent would not get updated z position when 
  moving a stack (stacks would look like they were underneath 
  other cards when moved and dropped)
fixed bug where rotation could result in the opponent seeing a card 
  snap into a pile it was near
added ability to draw from Force Pile and retrieve from Lost Pile
  ('d' and 'x', respectively)
added ability to change text color for opponent's and your chat messages, 
  which allows easier understanding of what happens in the game.  informational 
  messages are shown in the color set in holotable.rc

***********************************
Changes/bugfixes for version 0.4.1:
***********************************

fixed a few bugs in the network code, which should prevent several different problems, 
  especially when using the central server
added a "Restore Defaults" button to the Options dialog, per several people's request.
  it restores the default playing surface size, window size, and server IP and port number
several additional messages are displayed in the chat/log window
bugfix so that more than ~70 cards may be moved in a stack at once
table size auto-adjust should now work when playing over the central server
added keyboard shortcuts for activating, using, and losing Force
pile positions may be set in holotable.ini, and are automatically sent to the opponent 
  when connecting peer to peer or starting a game over the central server
fixed problems related to rotating cards while on a pile/at the bottom right corner of the 
  table

***********************************
Changes/bugfixes for version 0.4.0:
***********************************

cards "stick" to the cursor reliably when moving in real time
stacks can now be moved in real time (user can turn on and off)
image "zoom" happens after a user-configurable delay, so it acts more like tooltip text
added support for Force Pile, Reserve Deck, Used Pile, and Lost Pile areas (moveable)
cards "snap" to these areas when dropped over them, and are automatically rotated to
  the correct orientation
status bar shows count of Force Pile, Reserve Deck, Used Pile, and Lost Pile for each player
added in-game chat capability
chat area logs movement of cards to and from each player's hand
chat area logs shuffling of stacks on the table, and opponent will see the
  shuffle graphic over the stack that was shuffled
overhauled network code, resulting in much better stability
program exit is confirmed with a dialog box
fixed bug where hand area could get stuck in the not visible state
HOLOTABLE_PATH environment variable allows intelligent loading of files
installer creates holotable.ini on the fly, so you don't have to modify it if you 
  don't use the default installation directory
several options to configure the "look" of the program through the holotable.rc file
option to auto-adjust table size if opponent's table size is larger (can force an 
  adjustment by menu command also)
various code tweaks to improve speed, reduce processor load, etc.


***********************************
Changes/bugfixes for version 0.3.1:
***********************************

added key reference dialog
both hand counts now shown at all times on a status bar
when images exist, show large image instead of tooltip text ("zoom")

***********************************
Changes/bugfixes for version 0.3.0:
***********************************

added server lobby (opponent selection and chat) capability to Holotable and the server program

***********************************
Changes/bugfixes for version 0.2.2:
***********************************

fixed bug where cards could get out of sync when double or triple right-clicking to flip
fixed some of the flicker/redraw problems associated with selecting cards

***********************************
Changes/bugfixes for version 0.2.1:
***********************************

fixed crash when selecting a stack of cards
border configurable according to card set

*********************************
Changes/bugfixes for version 0.2:
*********************************

could not connect multiple times to server without restarting
added 'f' key flip functionality
fixed problem where server port number did not load from options 
     file correctly
fixed problem where deck loader couldn't handle lines without a 
     color spec
fixed problem where remote deck files couldn't end without a 
     newline after the last card
added support for background image on table
added color to hand background
added rotation support
fixed problem where only first connection works when connecting 
     peer to peer
added ability to query for own and opponent's number of cards in 
     hand
added vertical and horizontal fan capability
added ability to cancel an accept()
made move to/from hand keep the layout of cards
added graphic that shows when shuffling
worked around tooltip character limit for objectives/made card text 
     separate for each side
options dialog doesn't lose info when cancel is pressed (original 
     settings restored in window)
made default buttons work (Options dialog, About dialog)
fixed problem where dialogs got killed forever if you close them with 
     the "X"
new program icon
took care of white corners on cards
added option for moving single cards in real time
added options for window startup size and table background
added icons to menu items
updated About dialog
configurable card border based on card type
