# c\_formatter\_42.vim

Vim plugin for [c\_formatter\_42](https://github.com/dawnbeen/c_formatter_42).

![preview](preview.gif)

## Installation

### [Plug](https://github.com/junegunn/vim-plug)

```
Plug 'cacharle/c_formatter_42.vim', { 'do': 'git submodule update c_formatter_42' }
```

### Other

I don't know, install plug maybe?

## Usage

Execute `:CFormatter42` or press `F2` to format the current file.

## Configuration

Add the following lines to your `.vimrc` if you want to enable these options.

### Default formatter

Set `c_formatter_42` has the default formatter (you can use `gg=G` or enter visual mode and `=`).

```
let g:c_formatter_42_set_equalprg=1
```

### Disable format on save

```
let g:c_formatter_42_format_on_save=0
```
