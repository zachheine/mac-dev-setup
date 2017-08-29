# mac-dev-setup

- clean install `[sudo /Applications/Install\ macOS\ Sierra.app/Contents/Resources/createinstallmedia --volume /Volumes/Untitled --applicationpath /Applications/Install\ macOS\ Sierra.app --nointeraction]`

- start download of XCode

- install homebrew http://brew.sh

- install git `brew install git`
`git config --global user.name "Zach Heineman"`
`git config --global user.email "zach@heineman.info"`

- clean up dock `brew install dockutil (https://github.com/kcrawford/dockutil)`
dock plist location = ~/Library/Preferences/com.apple.dock.plist

- install homebrew cask `brew tap caskroom/cask`

`export HOMEBREW_CASK_OPTS="--appdir=~/Applications --fontdir=/Library/Fonts"`

- install github desktop `brew cask install github-desktop`
- install Sublime Text 3 `brew cask install sublime-text`
- install Dropbox `brew cask install dropbox`

- install Creative Cloud desktop https://www.adobe.com/creativecloud/desktop-app.html

- install microsoft Office https://www.microsoftstore.com/store/msusa/en_US/DisplayDownloadHistoryPage/

`sudo spctl --master-disable` #allows app downloads from "Anywhere"

`defaults write com.apple.finder AppleShowAllFiles -bool YES && killall Finder` #show dotfiles in finder

QUICK LOOK PLUGINS
brew cask install qlmarkdown
