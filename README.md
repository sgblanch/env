# env

User configuration files with an emphasis on macOS, although an incomplete effort has been made to support linux.  Some of these files have origins in Debian's `/etc/skel/`.

## Installation

**WARNING** These instructions are nowhere near complete and/or correct.  Following them may be dangerous!

**WARNING** If you plan on using these, you will likely want to fork this repository before using so you can make changes

### XCode Command Line Tools

```bash
xcode-select -p || xcode-select --install 
```

### Legacy Headers (macOS 10.14/Mojave)

Apple in their...infinite wisdom...has decided to not put header in `/usr/include` by default.  This can lead to unexpected results when compiling software.  We can install the 'legacy' header files into `/usr/include` to make our life easier.

**NOTE** If you are on macOS 10.14 and `macOS_SDK_headers_for_macOS_10.14.pkg` is missing, try running `xcode-select --install` again.  Your Command Line Tools may be from a previous OS release.

```bash
sudo installer -pkg "$(xcode-select -p)/Packages/macOS_SDK_headers_for_macOS_10.14.pkg" -target /
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
            ssh/config tmux-osx.conf tmux-theme.conf \
            tmux.conf vim/bundle vimrc; do
    ln -s ~/opt/env/"$dotfile" "$HOME/.$dotfile"
done

git config --global user.name "John Doe"
git config --global user.email "jdoe@uncc.edu"
git config --global core.excludesfile ~/.gitignore_global
git config --global core.editor "nano"
```

## Required & Recommended Packages

### Applications


* [R](https://cloud.r-project.org/bin/macosx/)
* [clang and gfortran for R](https://cloud.r-project.org/bin/macosx/tools/)
* [XQuartz](https://www.xquartz.org/)
* [Microsoft Teams](https://teams.microsoft.com/downloads)
* [Google Drive File Stream](https://dl.google.com/drive-file-stream/GoogleDriveFileStream.dmg)
* [Java 8 (for neo4j)](https://www.oracle.com/technetwork/java/javase/downloads/index.html#JDK8)

### homebrew

```bash
brew install bash-completion brew-cask-completion colordiff \
        coreutils ctags gawk git-flow git-lfs go lesspipe \
        mercurial nano neo4j pip-completion python python@2 \
        reattach-to-user-namespace tmux xz
```

### homebrew casks

```bash
brew tap homebrew/cask
brew cask install julia knime macvim rstudio \
        sourcetree visual-studio-code zotero
```
