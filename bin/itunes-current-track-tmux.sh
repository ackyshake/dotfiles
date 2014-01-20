#!/usr/bin/env zsh
ITUNES_TRACK=$(osascript <<EOF
if appIsRunning("iTunes") then
    tell app "iTunes" to get the name of the current track
end if

on appIsRunning(appName)
    tell app "System Events" to (name of processes) contains appName
end appIsRunning
EOF)

if test "x$ITUNES_TRACK" != "x"; then
ITUNES_ARTIST=$(osascript <<EOF
if appIsRunning("iTunes") then
    tell app "iTunes" to get the artist of the current track
end if

on appIsRunning(appName)
    tell app "System Events" to (name of processes) contains appName
end appIsRunning
EOF)

ITUNES_ALBUM=$(osascript <<EOF
if appIsRunning("iTunes") then
    tell app "iTunes" to get the album of the current track
end if

on appIsRunning(appName)
    tell app "System Events" to (name of processes) contains appName
end appIsRunning
EOF)

# Musical Symbols: ☊ ♫ ♪. Use anyone you like.

echo ' | ♪' $ITUNES_TRACK '-' $ITUNES_ARTIST '('$ITUNES_ALBUM')'
fi
