# Bash startup scripts

**NOTE:** These are my personal *bash* startup scripts, built up over years
and years of Unix use. You are free to crib from them, or even steal them
outright. But I don't support them, except for myself, so you're on your
own. Obviously, the standard disclaimers apply (use at your own risk;
if you use them, and your system catches fire, it's not my fault; no warranty;
blah blah blah).

## What I do

* Symlink `bashrc` to `$HOME/.bashrc`
* Ensure that `$HOME/.bashrc` is loaded (e.g., via `$HOME/.bash_profile`)
* Make sure the path contains `domain`, `platform`, `hostname` and
  `pathclean` executables

All should be good after that.

Even works with Cygwin, on Windows.

