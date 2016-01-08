#!/bin/bash
#
# 1. Intall Xcode from App Store
# 2. Check agreement xcode license
#   $ sudo xcodebuild -license
# 3. Run this script
#   $ ./osx.sh
#

# Install homebrew
if which brew >/dev/null; then
  echo Installed homebrew.
else
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew install python
brew install ansible

# Set terminal.app theme
TOMORROW_NIGTH="tomorrow_night"
if [ ! -f "${TOMORROW_NIGHT}.terminal" ]; then
  curl -o tomorrow_night.terminal https://raw.githubusercontent.com/chriskempson/tomorrow-theme/master/OS%20X%20Terminal/Tomorrow%20Night.terminal  
fi
CURRENT_PROFILE="$(defaults read com.apple.terminal 'Default Window Settings')"
if [ "${CURRENT_PROFILE}" != "${TOMORROW_NIGTH}" ]; then
  open ./${TOMORROW_NIGTH}.terminal
  sleep 1; # Wait a bit to make sure the theme is loaded
  defaults write com.apple.terminal 'Default Window Settings' -string "${TOMORROW_NIGTH}"
  defaults write com.apple.terminal 'Startup Window Settings' -string "${TOMORROW_NIGTH}"
  rm ./${TOMORROW_NIGTH}.terminal
fi

