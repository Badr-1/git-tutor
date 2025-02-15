<div align="center">
    <img src="logo.png" width="456" height="228" >
</div>

# git-tutor

I like git, that's not a secret now, I've built git extensions to help me explain it better before, but this one is special, I enjoyed using [learn git branching](https://learngitbranching.js.org/) but I didn't like that I had to open the web for it, after all git is a cli-tool, so why not create one for the cli, and here it's `git-tutor` the name is inspired from `vimtutor`, obviously.

The Whole Idea of it is to create an abstraction for git commands to use them without caring about the actually content of the commit - if you don't want to - and just care about the overall functionality.

## Installation
To install `git-tutor` copy it to a directory included in your `$PATH`.
This allows you to use it either by `git tutor` as a git extension or `git-tutor` as a regular command.

Or Use Installation Scripts.

Linux
``` bash
curl -sSL https://raw.githubusercontent.com/Badr-1/git-tutor/main/install.sh | bash
```
Windows
```powershell
irm https://raw.githubusercontent.com/Badr-1/git-tutor/main/install.ps1 | iex
```

## Usage

```
Usage: 
  git-tutor play                  Start playing a specific level
  git-tutor diff <base> <target>  Start Playing in freestyle
  git-tutor sandbox               Start sandbox mode

Git Commands:
  commit [--amend]                Create a new commit
  checkout [-b] <ref>             Checkout or create a branch
  switch [-c] <ref>               Switch or create a branch
  cherry-pick <commit>            Cherry-pick a commit to current branch
  rebase <branch>                 Rebase current branch onto specified branch
  branch <name>                   Create a new branch
  merge <name>                    Merge Branches
  log [--all]                     Show commit history
  revert <commit>                 Revert a commit
  reset <ref>                     Reset HEAD to specified commit

Tool Commands:
  Description                     Shows Level Description
  Hint                            Show Hint on How to solve the Level
  base                            Generate a base repository from sandbox for freestyle play
  goal                            Generate a goal repository from sandbox for freestyle play
  clear                           Clear screen and show progress
  reset                           Reset current level
  help                            Show this help message
  exit                            Exit the game
```

git-tutor supports three distinct modes:
- sandbox: for experiments
- guided tutorials: based on levels
- freestyle: how to shape a repository into another

## How To Contribute

There are **Three** ways you could contribute with:

### First: Design Levels
Each level consists of the following:
- Description: What we should do in the level?
- Hint: How to solve the level?
- Goal
- Base

Levels are now bundled outside `git-tutor` for extensibility into plugins see [plugin.gt](/plugin.gt) with extension `gt` and put into `~/.git-tutor` directory.

### Second: New Commands
The available commands now aren't much, and commands options aren't fully implemented.\
Few Notes when adding new Command or option
- It shouldn't be a direct command from git but rather an abstraction of it.
- You Should test it:
  - first: in the sandbox mode
  - second: create a level with it, to see if it works properly

There are three places where the commands are added to:
1. `cmd_exe_sandbox`: for sandbox mode
2. `cmd_exe_load`: for loading levels
3. `cmd_exe_play`: for playing levels

And into the `help` with its description.


### Third: Testing & Reporting Bugs
You could help by simply pointing out errors and bugs with the current implementation.
1. Open an Issue
2. Steps to replicate the bug

If you could solve it, just open a Pull request, and I'd be happy to review it as soon as possible.

## License
This project is licensed under the MIT License. See the LICENSE file for details. 