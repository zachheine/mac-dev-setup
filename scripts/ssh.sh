# https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/

ssh-keygen -t rsa -b 4096 -C "zach@heineman.info"

eval "$(ssh-agent -s)"

vi ~/.ssh/config

# Host *
#  AddKeysToAgent yes
#  UseKeychain yes
#  IdentityFile ~/.ssh/id_rsa

ssh-add -K ~/.ssh/id_rsa

# https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/

pbcopy < ~/.ssh/id_rsa.pub

# Copy to github settings