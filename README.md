# nvim-startup.lua

> Displays neovim startup time

## Summary

- [Installation](#installation)
- [Usage](#usage)
- [Configuration](#configuration)
- [Contribution guidelines](#contribution-guidelines)
    - [Requirements](#requirements)
    - [Steps](#steps)

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
require 'nvim-startup'.setup()
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

The example below represents all the possible settings with their respective types and default values

```lua
require 'nvim-startup'.setup {
    startup_file = '/tmp/nvim-startuptime' -- sets startup log path (string)
    message = 'Whoa! those {} are pretty fast' -- sets a custom message (string | function)
    message = function(time) -- function-based custom message
        time < 100 and 'Just {}? really good!' or 'Those {} can get faster'
    end
}
```

## Contribution guidelines

### Requirements

The following tools are needed in order to properly setup the development workflow:

- `make`
- [`luarocks`](https://github.com/luarocks/luarocks)
- [`rustup`](https://github.com/rust-lang/rustup)
- [`nodejs`](https://github.com/nodejs/node)

### Steps

If you're willing to contribute to `nvim-startup`, it's highly recommended to follow the steps below (for organization purposes)

1. Fork the repo
2. Open a new branch following one of the following naming patterns
    - `feat/<branch_name>` for features
    - `fix/<branch_name>` for bugfixes
    - `chore/<branch_name>` for small changes that doesn't fit the ones above
3. Run `make init` to setup the development environment
4. All commits must follow a similar naming pattern as the branches (which will be enforced by `commitlint`), examples below:
    - `feat: <commit_message>` for features
    - `fix: <commit_message>` for bugfixes
    - `chore: <commit_message>` for small changes that doesn't fit the ones above
5. Submit your PR! (preferably a small one and concise one, for a faster code review)

> Pull requests that stricly follow the recommendations above will have higher priority in contrast of those who don't
