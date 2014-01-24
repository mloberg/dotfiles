# dotfiles

My collection of dotfiles and other tools.

## dotfiles

Dotfiles are symlinked to the user's home directory and are defined by a *.symlink* extension. This applies to both files and directories and searches within directories, so you can organize it however you like. There is exception to this rule, *darwin*, *linux*, *lib*, and *tools* are ignored by default, but this can be changed in the install script.

There are two system specific folders, *darwin* and *linux*. If you have dotfiles you only want for a specific system, you can put them here and they will only be linked if installing on that system.

## Templates

Templates are useful for getting user interactions or including/excluding certian lines based on the system. Templates are written in Python, easy to use, and powerful. They use *.template.py* for an extension and follow the same rules are dotfiles.

Template files should include a *template* variable that holds the template string and a *variables* dictionary with variables for the template. Template variables use double curly braces `{{ variable_name }}`.

Let's take a look at an example:

	# example.template.py -> ~/.example
	template = "Hello {{ name }} from a template!"
	variables = {'name': lambda: raw_input("Name: ").strip()}

As you can see variables can hold callable values (lambda's, etc) that will be processed on render. The above example will ask you for a name when it renders. So if I inputed my name, the resulting template would be `Hello Matt from a template!`

## Repos

You can define git repos that should be cloned in *repos.json*. This will check that the repo exists. If it does, it will make sure the url and branch is correct and pull the latest code. If not, it will clone the repo.

*repos.json:*

	{
		"repos": [
			{
				"url": "git://remote-git-repo",
				"target": "~/path/to/clone",
				"branch": "custom-branch"
			},
			{
				"url": "git://another-repo",
				"target": "~/path/to/another-repo"
			}
		]
	}

If branch is not define, *master* is assumed.

## Tools

There are a collection of scripts that I end up using a lot when setting up new systems in *tools*. Some of these scripts might be platform specific to RedHat based distributions.

## Install

Run `./install`

This calls the Python installer, which links dotfiles, renders templates, and clones repos. Then run other bash commands (such as installing packages, reload bash, etc). Feel free to add anything you need to install.

## Customizing

I wrote this to be very customizable and easy to use. You can fork it, add your own dotfiles, templates, install commands, etc.