#!/bin/bash

# Spotify credentials - load from external file to avoid hard-coding secrets
SPOTIFY_CREDENTIALS_FILE="$HOME/.config/spotify/credentials.sh"
if [[ ! -f "$SPOTIFY_CREDENTIALS_FILE" ]]; then
    echo "Error: Spotify credentials file not found at $SPOTIFY_CREDENTIALS_FILE"
    echo "Create it with:"
    echo "  export SPOTIPY_CLIENT_ID='your_client_id'"
    echo "  export SPOTIPY_CLIENT_SECRET='your_client_secret'"
    exit 1
fi
# shellcheck source=/dev/null
source "$SPOTIFY_CREDENTIALS_FILE"

# Spotify Playlists
Playlists=(
  https://open.spotify.com/playlist/7K0VtknJmxne7BXsJOll29?si=oZvoqOd5RAeoerzaPQNQRQ
  https://open.spotify.com/playlist/2rzU10U9STx64ecozYyEG4?si=xiURHXXSSIeH5NPOSLPUiQ
  https://open.spotify.com/playlist/1GkGHZtqyiUO6Zy6it48Q1?si=3UM38tRzSNuWedzvKPg55w
  https://open.spotify.com/playlist/0Oy1vo4VAZQPw0Z2o4OjPe?si=128392d0a7dd4fbf
  https://open.spotify.com/playlist/3c2E7bUuS4TzflMS7YtRfx?si=f7630e95fb024363
  https://open.spotify.com/playlist/5Bj7j5mDK9qS92GoHiC1V2?si=9b752be2edf7447f
  https://open.spotify.com/playlist/5cKr9Y56puMJer6XMpJobs?si=eafc87abd66a4dec
  https://open.spotify.com/playlist/7x3SiAEJqhboWuO4Q7mOWT
)

# Output Directory
OutputDir="$HOME/Music/spotify"

# Number of cores to use.
Cores=$(nproc)

# Skip adblock
SkipAdBlock=y

# Download Spotify Playlists
if ! command -v spotify_dl &>/dev/null; then
    echo "Error: spotify_dl is not installed. Install it with: pip install spotify_dl"
    exit 1
fi
spotify_dl -l "${Playlists[@]}" -o "$OutputDir" -s $SkipAdBlock -mc $Cores -w
