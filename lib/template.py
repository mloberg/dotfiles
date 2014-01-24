import re


class Template(object):

    def __init__(self, template, variables={}):
        self.template = template
        self.variables = variables

    def render(self):
        var = self._normalize_variables()
        var_regex_string = "|".join(map(re.escape, var.keys()))
        regex = re.compile("\{\{ ?(%s) ?\}\}" % var_regex_string)
        return regex.sub(lambda m: var[m.group(1)], self.template.strip())

    def render_to_file(self, filename):
        with open(filename, 'wb') as fp:
            fp.write(self.render())

    def _normalize_variables(self):
        variables = {}
        for name in self.variables:
            variable = self.variables[name]
            if callable(variable):
                variables[name] = variable()
            else:
                variables[name] = variable
        return variables
