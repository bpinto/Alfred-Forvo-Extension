Spotify Controls for Alfred
============

An AppleScript so you can search for [Forvo](http://www.forvo.com) words from [Alfred App](http://alfredapp.com/). You will need Alfred and the Powerpack to use this.

Installation
----------------

To install Forvo Search in Alfred double click on the [extension file](https://github.com/pfbruno/Alfred-Forvo-Extension/raw/master/Forvo.alfredextension).

How to use
----------------

Once installed with Alfred you can run the following commands


    forvo         :: 
    spot start    ::  To open or activate the Spotify application (can also use s or init)
    spot quit     ::  To quit the application (can also use kill, end, exit, q or e)
    spot pause    ::  Pause the current track (can also use stop or no command)
    spot play     ::  Play the current track (can also use no command)
    spot next     ::  Go to the next track (can also use n or >)
    spot prev     ::  Go to the previous track (can also use pr, previous, <, or <<)
    spot mute     ::  Toggles mute from on/off (can also use m)
    spot 50       ::  Sets the volume to the number specified after 'spot'
    spot search   ::  Search spotify
    spot app      ::  Open spotify application (only available in 0.8.0 or above)
    spot shuffle  ::  Toggle shuffle (only available in 0.8.0 or above)
    spot repeat   ::  Toggle repeat (only available in 0.8.0 or above)
    spot help     ::  Open this help file
    spot dev      ::  My info
    
    Growl Notifications (automatically copies results to the clipboard)
    spot now      ::  Current track name, artist, album and duration (can also use i or current)
    spot artist   ::  Artist and Album Artist if applicable
    spot album    ::  Album name
    spot disc     ::  Disc # if available
    spot time     ::  Track duration (can also use t or duration)
    spot plays    ::  Total plays for this track (can also use count)
    spot track    ::  The song name (can also use t or song or name)
    spot starred  ::  If the song is starred or not (can also use star or fav)
    spot rank     ::  The popularity of the song from 0 to 100 (can also use pop or popularity)
    spot id       ::  The spotify ID
    spot url      ::  The spotify HTTP URL
    spot appurl   ::  The spotify application URL
      

Examples
----------------
    $ spot next
    $ spot pause
    $ spot now
    $ spot 75
    $ spot artist
    $ spot rank
    $ spot url
    $ spot <<
    $ spot <
    $ spot
    $ spot search de la soul
    $ spot search artist:de la soul
    $ spot search album:stakes is high
    $ spot search track:sunshine
    $ spot app lastfm
    $ spot shuffle
    $ spot repeat
    $ spot help
    $ spot dev


Download
----------------
[Forvo Search](https://github.com/pfbruno/Alfred-Forvo-Extension/downloads)

## Version History ##
### 1.0.0 - March 30, 2011###
 
- Commit: Initial Release
