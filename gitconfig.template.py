import os.path
import platform
from lib.utils import input_prompt

template = """
[user]
  name = {{ name }}
  email = {{ email }}
[mergetool]
  keepBackup = true
[alias]
  co = checkout
  wtf = !git-wtf
  bf = !gitbf
  ds = diff --staged
  amend = commit --amend -C HEAD
  undo = reset --soft HEAD^
  ls = log --pretty=format:"%C(yellow)%h %C(blue)%ad%C(red)%d %C(reset)%s%C(green) [%cn]" --decorate --date=short
  standup = log --since '1 day ago' --oneline --author {{ email }}
  graph = log --graph --pretty=format':%C(yellow)%h%Cblue%d%Creset %s %C(white) %an, %ar%Creset'
"""
if platform.system().lower() == 'osx':
    template += """[credential]
  helper = /opt/boxen/bin/boxen-git-credential"""

# if git version >= 1.8
# [push]
#   default = simple

template += """[core]
  excludesfile = {{ home }}/.gitignore
[hub]
  protocol = https
"""

variables = {
    'name': lambda: input_prompt("Your name: ").strip(),
    'email': lambda: input_prompt("Your email: ").strip(),
    'home': os.path.expanduser('~'),
}
