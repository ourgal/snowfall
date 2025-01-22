# cli chat

```nix tangle:default.nix
args:
args.module (
  args
  // {
    path = ./.;
```

## nchat

Whatsapp and telegram client.
[github](https://github.com/d99kris/nchat)
`$ nchat --help`

```
nchat is a terminal-based telegram / whatsapp client.

Usage: nchat [OPTION]

Command-line Options:
    -d, --confdir <DIR>    use a different directory than ~/.config/nchat
    -e, --verbose          enable verbose logging
    -ee, --extra-verbose   enable extra verbose logging
    -h, --help             display this help and exit
    -k, --keydump          key code dump mode
    -m, --devmode          developer mode
    -r, --remove           remove chat protocol account
    -s, --setup            set up chat protocol account
    -v, --version          output version information and exit
    -x, --export <DIR>     export message cache to specified dir

Interactive Commands:
    PageDn      history next page
    PageUp      history previous page
    Tab         next chat
    Sh-Tab      previous chat
    Ctrl-f      jump to unread chat
    Ctrl-g      toggle show help bar
    Ctrl-l      toggle show contact list
    Ctrl-n      search contacts
    Ctrl-p      toggle show top bar
    Ctrl-q      quit
    Ctrl-s      insert emoji
    Ctrl-t      send file
    Ctrl-x      send message
    Ctrl-y      toggle show emojis
    KeyUp       select message
    Alt-d       delete/leave current chat
    Alt-e       external editor compose
    Alt-n       goto chat
    Alt-t       external telephone call
    Alt-/       find in chat
    Alt-?       find next in chat
    Alt-$       external spell check
    Alt-,       decrease contact list width
    Alt-.       increase contact list width

Interactive Commands for Selected Message:
    Ctrl-d      delete selected message
    Ctrl-r      download attached file
    Ctrl-v      open/view attached file
    Ctrl-w      open link
    Ctrl-x      send reply to selected message
    Ctrl-z      edit selected message
    Alt-c       copy selected message to clipboard
    Alt-q       jump to quoted/replied message
    Alt-r       forward selected message
    Alt-s       add/remove reaction on selected message
    Alt-w       external message viewer

Interactive Commands for Text Input:
    Ctrl-a      move cursor to start of line
    Ctrl-c      clear input buffer
    Ctrl-e      move cursor to end of line
    Ctrl-k      delete from cursor to end of line
    Ctrl-u      delete from cursor to start of line
    Alt-Left    move cursor backward one word
    Alt-Right   move cursor forward one word
    Alt-Backsp  delete previous word
    Alt-Delete  delete next word
    Alt-c       copy input buffer to clipboard (if no message selected)
    Alt-v       paste into input buffer from clipboard
    Alt-x       cut input buffer to clipboard

Report bugs at https://github.com/d99kris/nchat

```

```nix tangle:default.nix
    nixPkgs = "nchat";
```

## tg

Telegram client. unmaintained.
[github](https://github.com/paul-nameless/tg)

```nix tangle:default.nix
    enable = "tg";
  }
)
```
