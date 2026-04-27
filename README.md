# boilerplate
Automatic Development Environment Deployment Tool

## Requirements
Software used by the repository:
* make
* cmake
* pre-commit
* git
* clang suite (???)

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
make git-refresh
```
