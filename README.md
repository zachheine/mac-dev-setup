# mac-dev-setup

- clean install Big Sur: `sudo /Applications/Install\ macOS\ Big\ Sur.app/Contents/Resources/createinstallmedia --volume /Volumes/Untitled`

- start download of XCode

- install homebrew http://brew.sh

`git clone https://github.com/zachheine/mac-dev-setup.git`

- install git `brew install git`

`git config --global user.name "Zach Heineman"`

`git config --global user.email "zach@heineman.info"`

Add `Developer` folder: `mkdir ~/Developer`

https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/

- clean up dock `brew install dockutil (https://github.com/kcrawford/dockutil)`
dock plist location = ~/Library/Preferences/com.apple.dock.plist

`export HOMEBREW_CASK_OPTS="--appdir=/Applications --fontdir=/Library/Fonts"`

- install github desktop: `brew install github` https://desktop.github.com
- install Google Chrome: `brew install google-chrome` https://www.google.com/chrome
- install Slack: `brew install slack` https://slack.com
- install Visual Studio Code: `brew install visual-studio-code` https://code.visualstudio.com
- install Dropbox `brew install dropbox` https://www.dropbox.com/
- install Creative Cloud: `brew install adobe-creative-cloud` https://www.adobe.com/creativecloud/desktop-app.html
- install Microsoft Office: https://account.microsoft.com/services/office/install (don't forget to customize!)
- install Miro: `brew install miro` https://miro.com
- install Zoom: `brew install zoom` https://zoom.com

`sudo spctl --master-disable` #allows app downloads from "Anywhere"

`defaults write com.apple.finder AppleShowAllFiles -bool YES && killall Finder` #show dotfiles in finder

QUICK LOOK PLUGINS
brew cask install qlmarkdown

defaults write com.apple.dock persistent-others -array-add '{"tile-data" = {"list-type" = 1;}; "tile-type" = "recents-tile";}'; killall Dock
