import platform
from lib.dotfiles import Dotfiles, DotfileTemplates
from lib.repos import Repos, GitNotFoundException


def install():
    ignore_directories = ['lib', 'linux', 'darwin']

    # Dotfiles (*.symlink)
    dotfiles = Dotfiles(ignore=ignore_directories)
    dotfiles.find('.')
    dotfiles.find(platform.system().lower())
    dotfiles.symlink()

    # Templates (*.template.py)
    templates = DotfileTemplates(ignore=ignore_directories)
    templates.find('.')
    templates.find(platform.system().lower())
    templates.save()

    # repos.json
    try:
        repos = Repos.load_from_file('repos.json')
        repos.clone()
    except GitNotFoundException:
        print("Unable to find git to clone repos")
