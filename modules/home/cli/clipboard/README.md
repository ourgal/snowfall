# cli clipboard

```nix tangle:default.nix
args:
args.module (
  args
  // {
    path = ./.;
```

## clipmenu

Clipboard management using dmenu.
[github](https://github.com/cdown/clipmenu)
`$ clipmenu --help`

```
clipmenu is a simple clipboard manager using dmenu and xsel. Launch this
when you want to select a clip.

All arguments are passed through to dmenu itself.

Environment variables:

- $CM_DIR: specify the base directory to store the cache dir in (default: $XDG_RUNTIME_DIR, $TMPDIR, or /tmp)
- $CM_HISTLENGTH: specify the number of lines to show in dmenu/rofi (default: 8)
- $CM_LAUNCHER: specify a dmenu-compatible launcher (default: dmenu)
- $CM_OUTPUT_CLIP: if set, output clip selection to stdout
```

```nix tangle:default.nix
    enable = "clipmenu";
    nixPkgs = [
      # keep-sorted start
```

## clipboard-jh

Cut, copy, and paste anything, anywhere, all from the terminal.
[github](https://github.com/Slackadays/clipboard)
`$ cb --help`

```
┃ This is the Clipboard Project 0.9.1 (commit ), the cut, copy, and paste system for the command line.
┃ Examples
┃ cb ct Nuclear_Launch_Codes.txt contactsfolder (This cuts the following items into the default clipboard, 0.)
┃ cb cp1 dogfood.conf (This copies the following items into clipboard 1.)
┃ cb p1 (This pastes clipboard 1.)
┃ cb sh4 (This shows the contents of clipboard 4.)
┃ cb clr (This clears the contents of the default clipboard.)
┃ You can also choose which clipboard you want to use by adding a number to the end, or _ to use a persistent clipboard.
┃ More Info
┃ See the complete online documentation for CB at https://github.com/Slackadays/Clipboard.
┃ Show this help screen anytime with cb -h, cb --help, or cb help.
┃ You can also get more help in our Discord server at https://discord.gg/J6asnc3pEG
┃ All Actions Available
┃ cut,     ct │ Cut items into a clipboard.
┃ copy,    cp │ Copy items into a clipboard.
┃ paste,   p  │ Paste items from a clipboard.
┃ clear,   clr│ Clear a clipboard.
┃ show,    sh │ Show the contents of a clipboard.
┃ edit,    ed │ Edit the contents of a clipboard.
┃ add,     ad │ Add items to a clipboard.
┃ remove,  rm │ Remove items from a clipboard.
┃ note,    nt │ Add a note to a clipboard.
┃ swap,    sw │ Swap the contents of multiple clipboards.
┃ status,  st │ Check the status of a clipboard.
┃ info,    in │ Show info about a clipboard.
┃ load,    ld │ Load a clipboard into another clipboard.
┃ import,  imp│ Import a clipboard from a file.
┃ export,  ex │ Export a clipboard to a file.
┃ history, hs │ Show the history of a clipboard.
┃ ignore,  ig │ Ignore types of content in a clipboard.
┃ search,  sr │ Search for items in a clipboard.
┃ undo,    u  │ Placeholder: Not implemented yet
┃ redo,    r  │ Placeholder: Not implemented yet
┃ config,  cfg│ Show the configuration of CB.
┃ script,  sc │ Set a script to run for this clipboard.
┃ Copyright (C) 2023 Jackson Huff. Licensed under the GPLv3.
┃ This program comes with ABSOLUTELY NO WARRANTY. This is free software, and you are welcome to redistribute it under certain conditions.
```

```nix tangle:default.nix
      "clipboard-jh"
```

## yank

Yank terminal output to clipboard.
[github](https://github.com/mptre/yank)

```nix tangle:default.nix
      "yank"
      # keep-sorted end
    ];
  }
)
```
