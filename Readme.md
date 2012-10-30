# Polygot

Polygot is a simple framework for programmers who want to be able to switch between different langauages easily without having a really complicated .profile or .bashrc. It allows you to create simple little setup scripts for each lanaguage you use and then pull them into your current shell on-demand using a simple utility.

For example, I don't use clojurescript very often so I don't want it to be installed in my shell sessions by defualt.  However, I can load it up on demand using a single command.

```
poly load clojurescript
```

## Installation

clone this repo into ~/.poly

```
git clone https://github.com/mowat27/polygot.git ~/.poly
```

Add the following to .bashrc (or similar)

```
alias poly="source $HOME/.poly/polygot.bash"
poly load shell git java ruby jruby rails mysql emacs
```

Obviously, you should load the packages relevant to your world not mine.

## Usage

To get help, type 

```
poly help
```

To create a new polygot environment, simply create a script in your .poly directory named <env>.sh and it should be picked up automatically.

For example, I create ~/.poly/ioke.sh I can load Ioke by running

```
poly load ioke
```

Remember that ioke.sh will be 'dotted' into your environment so you shouldn't do anything that will kill the whole session like 

```
exit 0
```

because that will kill your shell.

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

### What if I want to uninstall a langauge from a session?

You need to start a new session that doesn't include the language you don't want.

### Do you want pull requests?

No thanks.  Please fork the project and set things up as you like.


