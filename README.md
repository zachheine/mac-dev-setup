# mac-dev-setup

FIRST - clean install

SECOND - start download of XCode

THIRD - explicity install command line tools `xcode-select --install`

FOURTH - install homebrew http://brew.sh

FIFTH - install homebrew cask `brew install caskroom/cask/brew-cask`

FIFTH(a) - install homebrew cask versions `brew tap caskroom/versions`

SIXTH - install Sublime Text 3 `brew cask install sublime-text3`

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
