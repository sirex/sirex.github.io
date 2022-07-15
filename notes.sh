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


# 2022-03-06 09:56 Upgrade pip
env/bin/pip install --upgrade pip


# 2022-05-13 12:56 Fixin pip-tools error

#| ImportError: cannot import name 'BAR_TYPES' from
#| 'pip._internal.cli.progress_bars' (pip/_internal/cli/progress_bars.py)

# https://github.com/jazzband/pip-tools/issues/1617
env/bin/pip show pip
#| Version: 22.1
env/bin/pip install pip==22.0.4
