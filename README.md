# gitbooty

A tool for managing dotfiles in [optionally encrypted] git repositories :pirate_flag: :gift:

## installation

```sh
mkdir -p ~/git
git clone https://github.com/briceburg/gitbooty.git ~/git/gitbooty
sudo ln -fs ~/git/gitbooty/bin/{gitbooty,gitbooty-crypt} /usr/local/bin/
```

## usage

:bulb: **use `gitbooty` as you would `git`**

* files are managed under the user's home directory, e.g. ~/.bashrc, ~/.ssh/config, &c. when running normally.
* to manage system files outside the user's home, e.g. /etc/keyd/foo.conf, run `gitbooty` as the root user (`sudo gitbooty ...`).
* if a dotfile is sensitive, use the `gitbooty-crypt` command instead. files managed under `gitbooty-crypt` are kept in a separate repository (defined by `GITBOOTY_REPO_CRYPT`).

### sync user dotfiles

```sh
gitbooty pull
```

### sync system dotfiles

```sh
sudo gitbooty pull
```

### add a new dotfile

```sh
gitbooty add path-to/new-file
gitbooty commit -m "adding new-file" 
gitbooty push origin HEAD
```

### update dotfile(s)

### update dotfiles

```sh
# preview changes
gitbooty status
gitbooty diff

# commit changes
gitbooty commit -am "updating dotfiles"
gitbooty push origin HEAD
```

### configuration

repositories and branches are customized through environment variables which can be added to your profile.

envar | description | default
--- | --- | ---
GITBOOTY_REPO | repository holding dotfiles | `https://github.com/briceburg/booty-dotfiles`
GITBOOTY_REPO_CRYPT | repository holding encrypted dotfiles | `gcrypt::https://github.com/briceburg/booty-crypt`
GITBOOTY_BRANCH | branch holding user's dotfiles | `briceburg/archlinux`
GITBOOTY_BRANCH_SYSTEM | branch holding system dotfiles (when gitbooty runs as root) | `system/archlinux`

### encryption

by default, the GITBOOTY_REPO_CRYPT references a gcrypt prefixed repo (e.g. `gcrypt::https://github.com/briceburg/booty-crypt` is the origin). it may be preferable to keep _all_ dotfiles in the encrypted repo... although the unencrypted repo is easier to navigate and referentially use.

the system bootstrap (`bootystrap` from the [dotfiles repo](https://github.com/briceburg/booty-dotfiles)) should take care of installing gcrypt dependencies.
