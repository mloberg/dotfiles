import os
import sys
import fnmatch
from .six.moves import input

def query_yes_no(question, default="yes"):
    valid = {"yes": True, "y": True, "ye": True, "no": False, "n": False}
    if default is None:
        prompt = " [y/n] "
    elif default == "yes":
        prompt = " [Y/n] "
    elif prompt == "no":
        prompt = " [y/N] "
    else:
        raise ValueError("invalid default answer: '%s'" % default)

    while True:
        sys.stdout.write(question + prompt)
        choice = input().lower()
        if default is not None and choice == '':
            return valid[default]
        elif choice in valid:
            return valid[choice]
        else:
            sys.stdout.write("Please response with 'yes' or 'no'\n")


def which(name, flags=os.X_OK):
    result = []
    exts = filter(None, os.environ.get('PATHEXT', '').split(os.pathsep))
    path = os.environ.get('PATH', None)
    if path is None:
        return []
    for p in os.environ.get('PATH', '').split(os.pathsep):
        p = os.path.join(p, name)
        if os.access(p, flags):
            result.append(p)
        for e in exts:
            pext = p + e
            if os.access(pext, flags):
                result.append(pext)
    return result


def find_files(path, filter_pattern, ignore=[]):
    results = []
    for root, dirnames, filenames in os.walk(path):
        for dirname in dirnames:
            if dirname in ignore:
                dirnames.remove(dirname)
        for dirname in fnmatch.filter(dirnames, filter_pattern):
            results.append(os.path.join(root, dirname))
            dirnames.remove(dirname)
        for filename in fnmatch.filter(filenames, filter_pattern):
            results.append(os.path.join(root, filename))
    return results
