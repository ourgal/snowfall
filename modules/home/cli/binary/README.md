# cli binary

```nix tangle:default.nix
args:
args.module (
  args
  // {
    path = ./.;
```

## hexyl

A simple hex viewer.
[github](https://github.com/sharkdp/hexyl)
`$ hexyl --help`

```
A command-line hex viewer

Usage: hexyl [OPTIONS] [FILE]

Arguments:
  [FILE]
          The file to display. If no FILE argument is given, read from STDIN

Options:
  -n, --length <N>
          Only read N bytes from the input. The N argument can also include a unit with a
          decimal prefix (kB, MB, ..) or binary prefix (kiB, MiB, ..), or can be specified
          using a hex number. The short option '-l' can be used as an alias.
          Examples: --length=64, --length=4KiB, --length=0xff

          [aliases: bytes]
          [short aliases: c]

  -s, --skip <N>
          Skip the first N bytes of the input. The N argument can also include a unit (see
          `--length` for details).
          A negative value is valid and will seek from the end of the file.

      --block-size <SIZE>
          Sets the size of the `block` unit to SIZE.
          Examples: --block-size=1024, --block-size=4kB

          [default: 512]

  -v, --no-squeezing
          Displays all input data. Otherwise any number of groups of output lines which
          would be identical to the preceding group of lines, are replaced with a line
          comprised of a single asterisk

      --color <WHEN>
          When to use colors

          [default: always]

          Possible values:
          - always: Always use colorized output
          - auto:   Only displays colors if the output goes to an interactive terminal
          - never:  Do not use colorized output
          - force:  Override the NO_COLOR environment variable

      --border <STYLE>
          Whether to draw a border

          [default: unicode]

          Possible values:
          - unicode: Draw a border with Unicode characters
          - ascii:   Draw a border with ASCII characters
          - none:    Do not draw a border at all

  -p, --plain
          Display output with --no-characters, --no-position, --border=none, and
          --color=never

      --no-characters
          Do not show the character panel on the right

  -C, --characters
          Show the character panel on the right. This is the default, unless
          --no-characters has been specified

      --character-table <FORMAT>
          Defines how bytes are mapped to characters

          [default: default]

          Possible values:
          - default:       Show printable ASCII characters as-is, '⋄' for NULL bytes, ' '
            for space, '_' for other ASCII whitespace, '•' for other ASCII characters, and
            '×' for non-ASCII bytes
          - ascii:         Show printable ASCII as-is, ' ' for space, '.' for everything
            else
          - codepage-1047: Show printable EBCDIC as-is, ' ' for space, '.' for everything
            else
          - codepage-437:  Uses code page 437 (for non-ASCII bytes)

  -P, --no-position
          Whether to display the position panel on the left

  -o, --display-offset <N>
          Add N bytes to the displayed file position. The N argument can also include a
          unit (see `--length` for details).
          A negative value is valid and calculates an offset relative to the end of the
          file.

          [default: 0]

      --panels <N>
          Sets the number of hex data panels to be displayed. `--panels=auto` will display
          the maximum number of hex data panels based on the current terminal width. By
          default, hexyl will show two panels, unless the terminal is not wide enough for
          that

  -g, --group-size <N>
          Number of bytes/octets that should be grouped together. You can use the
          '--endianness' option to control the ordering of the bytes within a group.
          '--groupsize' can be used as an alias (xxd-compatibility)

          [default: 1]

          Possible values:
          - 1: Grouped together every byte/octet
          - 2: Grouped together every 2 bytes/octets
          - 4: Grouped together every 4 bytes/octets
          - 8: Grouped together every 8 bytes/octets

      --endianness <FORMAT>
          Whether to print out groups in little-endian or big-endian format. This option
          only has an effect if the '--group-size' is larger than 1. '-e' can be used as
          an alias for '--endianness=little'

          [default: big]

          Possible values:
          - little: Print out groups in little-endian format
          - big:    Print out groups in big-endian format

  -b, --base <B>
          Sets the base used for the bytes. The possible options are binary, octal,
          decimal, and hexadecimal

          [default: hexadecimal]

      --terminal-width <N>
          Sets the number of terminal columns to be displayed.
          Since the terminal width may not be an evenly divisible by the width per hex
          data column, this will use the greatest number of hex data panels that can fit
          in the requested width but still leave some space to the right.
          Cannot be used with other width-setting options.

  -h, --help
          Print help (see a summary with '-h')

  -V, --version
          Print version
```

```nix tangle:default.nix
    nixPkgs = "hexyl";
  }
)
```
