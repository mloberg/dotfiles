import os
import json
import subprocess
from .utils import which


class GitNotFoundException(Exception):
    pass


class Repos(object):

    def __init__(self, repos={}):
        self.repos = repos
        git = which('git')
        if not git:
            raise GitNotFoundException("Unable to find git in PATH")
        self.git = git.pop()

    @classmethod
    def load_from_file(cls, filename):
        raw_json = open(filename, 'rb').read().decode("utf-8")
        repos = json.loads(raw_json)['repos']
        instance = cls(repos)
        return instance

    def add(self, name, url, target):
        self.repos.append({'name': name, 'url': url, 'target': target})

    def dumps(self):
        print(self.repos)

    def clone(self):
        for repo in self.repos:
            target = os.path.expanduser(repo['target'])
            # Get branch to clone to
            branch = 'master'
            if 'branch' in repo:
                branch = repo['branch']
            # Check it repo is already cloned
            if os.path.isdir(target):
                if os.path.exists(os.path.join(target, '.git')):
                    self._fix_repo(target, repo['url'], branch)
                else:
                    # Error
                    pass
                continue
            # Clone repo
            subprocess.call([self.git, "clone", repo['url'], target])

    def _fix_repo(self, target, url, branch):
        cwd = os.getcwd()
        os.chdir(target)
        check_remote = [self.git, "config", "--get", "remote.origin.url"]
        remote = self._check_output(check_remote).strip()
        if remote != url:
            subprocess.call([self.git, "remote", "set-url", "origin", url])
        subprocess.call([self.git, "checkout", branch])
        subprocess.call([self.git, "pull"])
        os.chdir(cwd)

    def _check_output(self, cmd):
        proc = subprocess.Popen(cmd, stdout=subprocess.PIPE).communicate()
        return proc[0]
