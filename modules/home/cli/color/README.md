# cli color

```nix tangle:default.nix
args:
args.module (
  args
  // {
    path = ./.;
```

## pastel

Command-line tool to generate, analyze, convert and manipulate colors.
[github](https://github.com/sharkdp/pastel)
`$ pastel --help`

```
pastel 0.10.0
A command-line tool to generate, analyze, convert and manipulate colors

USAGE:
    pastel [OPTIONS] <SUBCOMMAND>

OPTIONS:
    -m, --color-mode <mode>
            Specify the terminal color mode: 24bit, 8bit, off, *auto*

    -f, --force-color
            Alias for --mode=24bit

        --color-picker <color-picker>
            Use a specific tool to pick the colors [possible values: gpick, xcolor, wcolor, grabc,
            colorpicker, chameleon, kcolorchooser, zenity, yad, hyprpicker, gdbus]

    -h, --help
            Print help information

    -V, --version
            Print version information

SUBCOMMANDS:
    color         Display information about the given color
    list          Show a list of available color names
    random        Generate a list of random colors
    distinct      Generate a set of visually distinct colors
    sort-by       Sort colors by the given property
    pick          Interactively pick a color from the screen (pipette)
    format        Convert a color to the given format
    paint         Print colored text using ANSI escape sequences
    gradient      Generate an interpolating sequence of colors
    mix           Mix two colors in the given colorspace
    colorblind    Simulate a color under a certain colorblindness profile
    set           Set a color property to a specific value
    saturate      Increase color saturation by a specified amount
    desaturate    Decrease color saturation by a specified amount
    lighten       Lighten color by a specified amount
    darken        Darken color by a specified amount
    rotate        Rotate the hue channel by the specified angle
    complement    Get the complementary color (hue rotated by 180°)
    gray          Create a gray tone from a given lightness
    to-gray       Completely desaturate a color (preserving luminance)
    textcolor     Get a readable text color for the given background color
    colorcheck    Check if your terminal emulator supports 24-bit colors.
    help          Print this message or the help of the given subcommand(s)
```

```nix tangle:default.nix
    nixPkgs = "pastel";
  }
)
```
