# boilerplate
Automatic Development Environment Deployment Tool

## How to use
```bash
# Add this repo as a submodule
git submodule add --force --depth 1 https://github.com/sz3kz/boilerplate.git external/boilerplate/
```
### CPP
```bash
# Initialize it
cd external/boilerplate/CPP/
make boilerplate-init

# Expose make commands
make boilerplate-refresh
make cmake-refresh
make clang-refresh
```
