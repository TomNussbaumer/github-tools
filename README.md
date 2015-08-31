# github-tools

## Commandline utility to simplify Github usage

If you are using Github a lot from the commandline this tool is exactly for you. It uses Github's REST api to fetch useful informations in JSON format or as plain lists.

**And best of all:** if the name of a current working directory matches a github user id you can even omit the user id.

### Features

```
USAGE: ght command [params]

commands:

help                   ... displays this page
version                ... displays version info
clone <repo>           ... clones a repository
info  [user-id]        ... returns account informations in json format
repos [user-id]        ... returns list of repository names
repos-urls [user-id]   ... returns list of repository urls
repos-json [user-id]   ... returns repos informations in json format
backup [user-id]       ... loop through all repos of a user account and
                           either clones them or uses 'git pull'.
root [abspath]         ... set prefix for command go
go <relpath>           ... changes to dir <root>/<relpath> if root is set
debug [on]             ... enables/disables debug
                           (without parameter == off]
import [user-id]       ... imports current git repo to github (note: the
                           user-id is derived from parent dir)


If you omit the optional parameter user-id, the name of the active
working directory will be used as github user-id.
```

### Example usage

```shell
# generate a directory which matches a github user id and enter it
mkdir TomNussbaumer && cd TomNussbaumer
# get list of all my repositories
ght repos
# clone one
ght clone github-tools
```

The ```ght backup``` may also be useful, if you want to get all repositories of a user and keep them up-to-date later on.

### Installation

**requirements:**

  1. any POSIX compliant shell
  2. POSIX compliant awk
  3. curl

The github tools doesn't come in the usual script form, but are meant to be sourced/included in other scripts. For interactive shells (terminal windows) this means you have to source/include it in one of the startup scripts.

When you are using bash, the startup script is called '.bashrc' and is located in your home directory. Just store file `github-tools-includes` somewhere on your computer and append the following line to file `.bashrc`:

```shell
source path-to-file/github-tools-includes
```

**...OR...**

**... just copy-and-paste the following line into a terminal window:**

```shell
curl -s https://raw.githubusercontent.com/TomNussbaumer/github-tools/master/install-to-bashrc.sh | bash
```

When you are not using the bash shell, then the name of the startup script will be different, but the procedure will be the same.

### Integration

All commands return valid exitcodes (0 for success). Just make sure that file `github-tools-includes` is sourced/included. Then you can use the features of ght in the unix-way to build other stuff.


### Testing

There is a simple test script called `test-github-tools.sh` to verify the correctness of the main features.

Beware of github user `tmp` while testing ;)


### TODO

Sourcing the whole functionality is somewhat stupid, I know. It just has grown this way from a few simple aliases and functions. If there is some spare time in the future I will convert it.


### Changelog

  * 2015-08-30 (v1.3.0): new command `import`
  * 2015-08-19 (v1.2.0): new commands `root` and `go` (for quick navigation)
  * 2015-08-19 (v1.1.0): new command `debug` (debug output on/off)
  * 2015-09-18 (v1.0.0): initial version
