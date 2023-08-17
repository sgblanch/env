# env

User configuration files with an emphasis on macOS, although an incomplete effort has been made to support linux.  Some of these files have origins in Debian's `/etc/skel/`.

## Installation

**WARNING** These instructions are nowhere near complete and/or correct.  Following them may be dangerous!

**WARNING** If you plan on using these, you will likely want to fork this repository before using so you can make changes

### XCode Command Line Tools

```bash
xcode-select -p || xcode-select --install 
```

### Create `~/opt`

```bash
install -m 0700 -d ~/opt
chflags hidden ~/opt
```

### Install homebrew

I don't recommend installing homebrew in the default location of `/usr/local`.  Too much other software will pollute that directory, some of which could conflict with homebrew.  The major disadvantage of installing homebrew elsewhere is that much of what homebrew installs will need to be compiled on your computer instead of taking advantage of the pre-compiled 'bottles' that homebrew provides

```bash
git clone https://github.com/Homebrew/brew ~/opt/brew
~/opt/brew/bin/brew tap homebrew/cask
```

### Downloading and Installing

**DANGER** You probably have some or many of these files with important settings.  Overwriting them could be bad.

**WARNING** Don't use a `.bash_profile`.  It will prevent `.profile` from being read.  Merge any changes you care about in `.bash_profile` into either `.profile` or a custom `.bash.d/*.sh`.

```bash
git clone --recurse-submodules https://github.com/sgblanch/env.git ~/opt/env

install -m 0700 -d ~/.ssh/mux
install -m 0750 -d ~/.vim/spell
install -m 0600 ~/opt/env/gitconfig{.tmpl,}
install -m 0600 ~/opt/env/bash.d/10defaults.sh{.tmpl,}

nano ~/opt/env/bash.d/10defaults.sh

for dotfile in bash.d bash_logout bashrc condarc editrc \
            gitattributes gitconfig gitignore_global \
            hgignore_global inputrc nanorc profile \
            Rprofile ssh/config tmux-darwin.conf \
	    tmux-linux.conf tmux-theme.conf tmux.conf \
	    vim/bundle vimrc; do
    ln -s ~/opt/env/"$dotfile" "$HOME/.$dotfile"
done

git config --global user.name "John Doe"
git config --global user.email "jdoe@uncc.edu"
git config --global core.excludesfile ~/.gitignore_global
git config --global core.editor "nano"
git config --global credential.helper osxkeychain
```

## Required & Recommended Packages

### Applications

* [gfortran for R](https://cloud.r-project.org/bin/macosx/tools/)

### homebrew

```bash
brew install colordiff coreutils ctags docker-completion \
        git-lfs go htop lesspipe nano \
        python qrencode reattach-to-user-namespace tio tmux xz \
        zsh-completions
```

### homebrew casks

```bash
brew install --cask balenaetcher bitwarden docker fontbase \
        google-{chrome,drive} gimp inkscape macvim \
        microsoft-{excel,onenote,powerpoint,word} quarto r rstudio slack \
        visual-studio-code xquartz zoom
```
