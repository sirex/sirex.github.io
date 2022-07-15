cd ~/dev/sirex.lt

# Build everything
make


# Rebuild everything
rm -rf env cache output
make


# Upgrade and rebuild everything
rm -rf env cache output
make upgrade
make


# Create new post
env/bin/nikola new_post


# Run local server
env/bin/nikola auto


# Publish content
env/bin/nikola build
PATH=$PWD/env/bin:$PATH env/bin/nikola github_deploy


# 2022-03-06 09:56 Upgrade pip
env/bin/pip install --upgrade pip


# 2022-05-13 12:56 Fixin pip-tools error

#| ImportError: cannot import name 'BAR_TYPES' from
#| 'pip._internal.cli.progress_bars' (pip/_internal/cli/progress_bars.py)

# https://github.com/jazzband/pip-tools/issues/1617
env/bin/pip show pip
#| Version: 22.1
env/bin/pip install pip==22.0.4


# 2022-07-15 11:46 ERROR: Nikola: install the "ghp-import"

env/bin/nikola github_deploy
#| ERROR: Nikola: In order to deploy the site to GitHub Pages, you must install the "ghp-import" Python package.
#| ERROR: Nikola: Exiting due to missing dependencies.

PATH=$PWD/env/bin:$PATH env/bin/nikola github_deploy
#| subprocess.CalledProcessError: Command '['ghp-import', '-h']' returned non-zero exit status 1.

env/bin/ghp-import -h
#| ImportError: cannot import name 'main' from 'ghp_import' (env/lib/python3.10/site-packages/ghp_import/__init__.py)

env/bin/pip uninstall ghp-import
env/bin/pip install --force-reinstall ghp-import2

PATH=$PWD/env/bin:$PATH env/bin/nikola github_deploy
