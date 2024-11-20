#!/bin/bash

# Spotify Environment Variables
export SPOTIPY_CLIENT_ID='13f646c1aec149dd818b5c4c590746e1'
export SPOTIPY_CLIENT_SECRET='a86bea90fb4a458bacad85407510fee6'

# Spotify Playlists
Playlists=(
  https://open.spotify.com/playlist/7K0VtknJmxne7BXsJOll29?si=oZvoqOd5RAeoerzaPQNQRQ
  https://open.spotify.com/playlist/2rzU10U9STx64ecozYyEG4?si=xiURHXXSSIeH5NPOSLPUiQ
  https://open.spotify.com/playlist/1GkGHZtqyiUO6Zy6it48Q1?si=3UM38tRzSNuWedzvKPg55w
  https://open.spotify.com/playlist/0Oy1vo4VAZQPw0Z2o4OjPe?si=128392d0a7dd4fbf
  https://open.spotify.com/playlist/3c2E7bUuS4TzflMS7YtRfx?si=f7630e95fb024363
  https://open.spotify.com/playlist/5Bj7j5mDK9qS92GoHiC1V2?si=9b752be2edf7447f
  https://open.spotify.com/playlist/5cKr9Y56puMJer6XMpJobs?si=eafc87abd66a4dec
)

# Output Directory
OutputDir="$HOME/Music/spotify"

# Number of cores to use.
Cores=11

# Skip adblock
SkipAdBlock=y

# Download Spotify Playlists
spotify_dl -l "${Playlists[@]}" -o "$OutputDir" -s $SkipAdBlock -mc $Cores -w
