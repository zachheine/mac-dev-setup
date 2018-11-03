# mac-dev-setup

- clean install `[sudo /Applications/Install\ macOS\ Sierra.app/Contents/Resources/createinstallmedia --volume /Volumes/Untitled --applicationpath /Applications/Install\ macOS\ Sierra.app --nointeraction]`

- start download of XCode

- install homebrew http://brew.sh

- install git `brew install git`
`git config --global user.name "Zach Heineman"`
`git config --global user.email "zach@heineman.info"`

https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/

- clean up dock `brew install dockutil (https://github.com/kcrawford/dockutil)`
dock plist location = ~/Library/Preferences/com.apple.dock.plist

- install homebrew cask `brew tap caskroom/cask`

`export HOMEBREW_CASK_OPTS="--appdir=/Applications --fontdir=/Library/Fonts"`

- install github desktop ~~`brew cask install github-desktop`~~ https://desktop.github.com
- install Google Chrome `brew cask install google-chrome`
- install Sublime Text 3 `brew cask install sublime-text`
- install Dropbox `brew cask install dropbox`

- install Creative Cloud desktop https://www.adobe.com/creativecloud/desktop-app.html

- install microsoft Office https://www.microsoft.com/en-us/download/office.aspx

`sudo spctl --master-disable` #allows app downloads from "Anywhere"

`defaults write com.apple.finder AppleShowAllFiles -bool YES && killall Finder` #show dotfiles in finder

QUICK LOOK PLUGINS
brew cask install qlmarkdown

defaults write com.apple.dock persistent-others -array-add '{"tile-data" = {"list-type" = 1;}; "tile-type" = "recents-tile";}'; killall Dock
