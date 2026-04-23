# dotfiles
Collection of configurations of my favourite tools!

## How to use
### CPP
```bash
# Add this repo as a submodule
git submodule add --force --depth 1 https://github.com/sz3kz/dotfiles.git external/dotfiles/

# Initialize it
cd external/dotfiles/CPP/
make dotfiles-init
```
Things you would probably want ( Still in CPP/ directory)
```bash
# Expose make commands
make dotfiles-refresh
make cmake-refresh
make ncu-refresh

# deploy the CMakeLists.txt template
make cmake-retemplate
```
