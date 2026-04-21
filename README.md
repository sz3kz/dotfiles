# dotfiles
Collection of configurations of my favourite tools!

## How to use
### CPP
```bash
git submodule add --depth 1 https://github.com/sz3kz/dotfiles.git external/dotfiles/
cd external/dotfiles/ && git sparse-checkout init --cone && git sparse-checkout set CPP/
