# nvim-startup.lua

> minimalistic startup time feedback

## Installation

Install it with your plugin manager of choice: 

#### [`paq-nvim`](https://github.com/savq/paq-nvim)

```
paq {'henriquehbr/nvim-startup.lua'}
```

#### [`vim-plug`](https://github.com/junegunn/vim-plug)

```
Plug 'henriquehbr/nvim-startup.lua'
```

After that, you just need to initialize the plugin, it's pretty simple, no more than a single line for that:

```
require 'nvim-startup'.display_startup_time()
```

The last step required for the plugin to work effectively, is to create a alias on your `.bashrc` or `.zshrc` like the one below:

```
alias nvim='nvim --startuptime /tmp/nvim-startup-time'
```

> By default, `nvim-startup` uses `'/tmp/nvim-startuptime'` as it's startup log file, but if you need to change that, you can specify a different path on the `g:nvim_startup_file` global variable

After that, you're done, just reload your nvim and hopefully you will see a message just like that:

```
Launched in <x> ms
```

## Configuration

### Global variables

- `g:nvim_startup_file` - allow setting startup log path through global variables (default: '/tmp/nvim-startuptime')

## Troubleshooting

In case you see the following message:

```
nvim-startup: couldn't retrieve startup time log file (...)
```

That means your startup log file doesn't exists, you might consider:

- Make sure if the file exists, is on the correct path, and you have the proper permissions to read it
- Checking if you remembered to setup a alias for your shell for generating the startup log file when launching neovim
