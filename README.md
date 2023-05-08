# OpenStem
An open format for sharing and mixing multitrack audio sources.

- *BASS* as the main bassline.
- *DRUM* as composed of: bottom (ie. kick), top (ie. hihat) and drop (ie. snare).
- *RYTHM* as composed of rythmic or percussive instruments.
- *HARMONY* as composed of melodic instruments or vocals.


Each channel is encoded as single mono WAV file with the filename starting with the channel identifier (ie. `1-bassline.wav`, `A_Acoustic Bass.wav`, `A.wav`, ...).

The files are stored in a folder ending with ".STEM8" or ".STEM14".

## Formats

### [STEM8](STEM8.txt)

This format contains 8 mono tracks.

### [STEM14](STEM14.txt)

This format contains 2 mono tracks and 6 stereo tracks, for a total of 14 channels.
