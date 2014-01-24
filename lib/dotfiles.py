import os
import re
import imp
from .utils import find_files, query_yes_no
from .template import Template


class DotfilesBase(object):

    def __init__(self, ext, ignore=[], target='~'):
        self.ext = ext
        self.ignore = ignore
        self.target = os.path.expanduser(target)
        self.files = []

    def find(self, path):
        self.files.extend(find_files(path, '*.%s' % self.ext, self.ignore))

    def dumps(self):
        print(self.files)

    def _get_filename(self, filename):
        basename = os.path.basename(filename)
        return '.' + re.sub(re.escape('.' + self.ext) + '$', '', basename)

    def _get_target(self, filename):
        return os.path.join(self.target, filename)


class Dotfiles(DotfilesBase):

    def __init__(self, ext='symlink', ignore=[], target='~'):
        super(Dotfiles, self).__init__(ext, ignore, target)

    def symlink(self):
        for dotfile in self.files:
            dotfile = os.path.abspath(dotfile)
            self._symlink_file(dotfile)

    def _symlink_file(self, dotfile):
        filename = self._get_filename(dotfile)
        target = self._get_target(filename)
        if os.path.lexists(target):
            if os.path.exists(target) is False:
                # Broken symlink
                os.remove(target)
            elif os.path.realpath(target) == dotfile:
                # Same file
                return
            elif query_yes_no("%s exists. Replace?" % target):
                # Replace file
                os.rename(target, target + '.orig')
            else:
                return
        os.symlink(dotfile, target)


class DotfileTemplates(DotfilesBase):

    def __init__(self, ext='template.py', ignore=[], target='~'):
        super(DotfileTemplates, self).__init__(ext, ignore, target)

    def save(self):
        for template_file in self.files:
            self._generate_template(template_file)

    def _generate_template(self, template_file):
        filename = self._get_filename(template_file)
        target = self._get_target(filename)
        if (os.path.exists(target) and
                query_yes_no("%s exists. Replace?" % target) is False):
            return
        template = imp.load_source('template', template_file)
        tmpl = Template(template.template, template.variables)
        tmpl.render_to_file(target)
