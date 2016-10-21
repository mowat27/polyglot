# Polyglot

Polyglot is a simple framework for programmers who want to be able to switch between different langauages easily without having a really complicated .profile or .bashrc/.zshrc. It allows you to create simple little setup scripts for each language you use and then pull them into your current shell on-demand using a simple utility.

For example, I don't use clojurescript very often so I don't want it to be installed in my shell sessions by default.  However, I can load it up on demand using a single command.

```
poly load clojurescript
```

## Installation

clone this repo into ~/.poly

```
git clone https://github.com/mowat27/polyglot.git ~/.poly
```

Add the following to .bashrc (or similar)

```
alias poly="source $HOME/.poly/polyglot.bash"
poly load example
```

This will load the provided example config at runtime.

## Usage

To get help, type

```
poly help
```

### Environment Setup

Instead of setting your dotfiles to configure environment variables like your PATH and language settings, you can separate your settings into individual files.

Simply create a script in your .poly/recipes directory named <env>.sh.  For example, I create ~/.poly/recipes/ioke.sh I can load Ioke by running

```
poly load ioke
```

Remember that ioke.sh will be 'dotted' into your environment so you shouldn't do anything that will kill the whole session like

```
exit 0
```

The github repo contains a [an example](https://github.com/mowat27/polyglot/blob/master/recipes/example.sh).

```shell
# Set language specific environment in a .sh file like this one
export SOME_CONFIG_VAR="hello world"
```

### Command Prompt Setup

You can control your command prompt (i.e. PS1 variable) using the prompt command to load one or more files from the prompts directory.

For example, if I have 2 files in prompts.

```shell
$ cat prompts/pwd
$(basename $PWD)
$ cat prompts/dollar
$
```
When I load them using the prompt command they are 'pushed' onto the PS1 in the order specified.

```shell
$ poly prompt pwd dollar
.poly$ # This is my new prompt
```

### Storing your prompts in a different place

I have found it easier to coordinate changes to my recipes and prompts between machines using Dropbox rather
than via GitHub because I kept forgetting to push my changes.

You can store recipes and/or prompts in a different location by exporting the following variables

```shell
export POLYGLOT_PROMPTS=$HOME/prompts
export POLYGLOT_RECIPES=$HOME/recipes
```

### Per-project setup

Sometimes, it's handy to have a per project setup.  You can do this by creating a file called Polyfile in any direrctory.  If you run poly with no arguments, it looks for the Polyfile and 'dots' it into your shell.

For example

```
$ cat Polyfile
echo hello world
poly load hadoop

$ poly
hello world
poly : Loading hadoop
```

## FAQ

### What if I want to uninstall a language from a session?

You need to start a new session that doesn't include the language you don't want.

### Do you want pull requests?

Yes please - but please don't send me your own language configs
