# mac-dev-setup

FIRST - clean install

SECOND - start download of XCode

THIRD - explicity install command line tools `xcode-select --install`

FOURTH - install homebrew http://brew.sh

FOURTH-POINT-FIVE - install git `brew install git`
`git config --global user.name "Zach Heineman"`
`git config --global user.name "zach@heineman.info"`

FOURTH-POINT-FIVE(a) - clean up dock `brew install dockutil (https://github.com/kcrawford/dockutil)`
dock plist location = ~/Library/Preferences/com.apple.dock.plist

FOURTH-POINT-FIVE(b) - install github desktop `brew cask install github-desktop`

FIFTH - install homebrew cask `brew install caskroom/cask/brew-cask`

FIFTH(a) - install homebrew cask versions `brew tap caskroom/versions`

SIXTH - install Sublime Text 3 `brew cask install sublime-text3`

SEVENTH - install Creative Cloud desktop https://www.adobe.com/creativecloud/desktop-app.html

EIGHTH - generate SSH key for Github https://help.github.com/articles/generating-ssh-keys/

NINTH - install Dropbox `brew cask install dropbox`

`sudo spctl --master-disable` #allows app downloads from "Anywhere"

`defaults write com.apple.finder AppleShowAllFiles -bool YES` #show dotfiles in finder

QUICK LOOK PLUGINS
brew cask install qlmarkdown

APPLICATIONS
brew cask install iterm2

brew tap caskroom/versions
brew cask install sublime-text3

RUBY
brew install ruby-build
brew install rbenv
rbenv install 2.1.2
rbenv global 2.1.2
