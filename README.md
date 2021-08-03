# nvim-startup.lua

> minimalistic startup time feedback

## Installation

If you're using one of these plugin managers:

- [`paq-nvim`](https://github.com/savq/paq-nvim)
- [`packer.nvim`](https://github.com/wbthomason/packer.nvim)
- [`vim-plug`](https://github.com/junegunn/vim-plug)
- [`Vundle.vim`](https://github.com/VundleVim/Vundle.vim)
- [`dein.vim`](https://github.com/Shougo/dein.vim)
- [`minipac`](https://github.com/k-takata/minpac)

The installation method is pretty much the same for all of them, simply initialize the plugin manager and include `henriquehbr/nvim-startup.lua` on the list

Otherwise, if you're using [`pathogen`](https://github.com/tpope/vim-pathogen), simply clone it on your `~/.vim/bundle` directory:

```
$ git clone --depth 1 https://github.com/henriquehbr/nvim-startup.lua
```

> `nvim-startup` is intended to be immediately executed on (n)vim startup, so if your plugin manager has some sort of `opt` funcionality that marks it as a optional plugin, avoid it!

## Usage

To get it up and running, first, `require` it on your config:

```
require 'nvim-startup'
```

Then, the last step required for the plugin to work effectively, is to create a alias on your `.bashrc` or `.zshrc` like the one below:

```
alias nvim='nvim --startuptime /tmp/nvim-startuptime'
```

> By default, `nvim-startup` uses `/tmp/nvim-startuptime` as it's startup log file, but if you need to change that, you can specify a different path on the `g:nvim_startup_file` global variable

After that, you're done, just reload your nvim and hopefully you will see a message just like that:

```
nvim-startup: running on the next (n)vim instance
```

Don't worry, that means the plugin still couldn't find the startup time log file on the first run, it's completely normal and expected to happen, it will work fine on subsequent runs of vim, with the message below:

```
nvim-startup: launched in <x> ms
```

## Configuration

### Global variables

- `g:nvim_startup_file` - allow setting startup log path through global variables (default: `'/tmp/nvim-startuptime'`)

## Troubleshooting

In case you see the following message:

```
nvim-startup: couldn't retrieve startup time log file (...)
```

That means your startup log file doesn't exists, you might consider checking if:

- The file exists, is on the correct path, and you have the proper permissions to read it
- You remembered to setup a alias for your shell for generating the startup log file when launching neovim

## Contribution guidelines

If you're willing to contribute to `nvim-startup`, it's highly recommended to follow the steps below (for organization purposes)

1. Fork the repo
2. Open a new branch following one of the following naming patterns
    - `feat/<branch_name>` for features
    - `fix/<branch_name>` for bugfixes
    - `chore/<branch_name>` for small changes that doesn't fit the ones above
3. All commits should also follow a similar naming pattern as the branches, examples below:
    - `feat: <commit_message>` for features
    - `fix: <commit_message>` for bugfixes
    - `chore: <commit_message>` for small changes that doesn't fit the ones above
4. When you're done, remember to run `make lint` in order to ensure code quality
    - For this step, you must have [`luarocks`](https://github.com/luarocks/luarocks) and `make` installed
5. Submit your PR! (a small one and concise one, for a faster code review)

> Pull requests that stricly follow the recommendations above will have higher priority in contrast of those who don't
