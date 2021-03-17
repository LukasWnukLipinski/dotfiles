# following instructions from here: https://www.atlassian.com/git/tutorials/dotfiles

#echo ".dotfiles" >> .gitignore
if [ -d "$HOME/.dotfiles" ]; then
  echo "error: directory ~/.dotfiles already exists."
  return 1	
fi


echo "initialising dotfiles"	
git clone --bare https://github.com/LukasWnukLipinski/dotfiles $HOME/.dotfiles

function dotfiles() 
{
   /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}

# checkout dotfiles into working dir $HOME
dotfiles checkout
if [ $? = 0 ]; then
  echo "Checked out dotfiles.";
  else
    echo "Backing up pre-existing dot files.";
    mkdir -p .dotfiles-backup
    dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfiles-backup/{}
fi;

dotfiles checkout
dotfiles config --local status.showUntrackedFiles no


