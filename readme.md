# Setting up new machine for iOS development

> Important: Some of the steps are not even iOS development specific. Just for regular developer tools and scripts to catalyze the development process.

## Set up development directory

It is good practice to create a `Workspace` directory at `~/`
There you can create following directory

```bash
root
+-- Workspace
    +-- Shells
    +-- git
        +-- <forked repositories>
    +-- work
        +-- <project name>
        +-- documentations
        +-- design
```

## Custom Terminal Commands

### • Custom Shell scripts

All customized terminal commands are store inside `Shell` directory in this repo.
Just paste it inside the Workspace directory.

### • bash_profile

To be able to consume this bash shells you need to update/create the `~/.bash_profile`

1. Copy the content from `_bash_profile` file in the repo.
2. Paste it inside the `~/.bash_profile`.

## Simulator in Full screen

run the following command to run simulator in full screen mode.

`defaults write com.apple.iphonesimulator AllowFullscreenMode -bool YES`

## Xcode

### Theme

Download the custom themes from `https://github.com/gauravkeshre/xcode-themes` under `~/Workspace/git`.

## Git

### SSH

```bash
cd ~/.ssh

#create a public private key
ssh-keygen -t rsa -C "<email_address_recommended"

#copy the public key to be placed in git repo settings
pbcopy < ~/.ssh/id_rsa.pub

```

### pre-commit hooks

At times you will need to setup pre-commit hooks so that you don't accidentally commit temp checks.

Refer to `_pre-commit` file in this repo to get some idea.

#### Updating/Creating pre-commit file

`touch ./.git/hooks/pre-commit`

### Fix committers for specific folders

You will not always want to commit with same mail ID.
for example for work you want to commit with your work mail id in git-config and for personal git repo you want to use your personal email.

Either you can go to every specific project folder and update the git config as:

```bash
git config --local user.name <preferred user name>
git config --local user.email <preferred email>
```

Or you can create certain rules for the same:

1. Create two individual gitconfig files, one for personal and one for work use as:

```bash
touch ~/.gitconfig-work

touch ~/.gitconfig-me
```

refer to both the files in this repo

2. Open gitignore in the root folder

```bash
e ~/.gitignore
```

Refer to the `_gitignore` file in this repo to see the changes
