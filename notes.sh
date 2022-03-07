cd ~/devel/sirex.lt/nikola

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
