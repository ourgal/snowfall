# cli bluetooth

```nix tangle:default.nix
args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
```

## bluetui

TUI for managing bluetooth on Linux.
[github](https://github.com/pythops/bluetui)
`$ bluetui --help`

```
Usage: bluetui

Options:
  -h, --help     Print help
  -V, --version  Print version
```

```nix tangle:default.nix
      "bluetui"
```

## bluetuith

TUI-based bluetooth connection manager.
[github](https://github.com/darkhz/bluetuith)
`$ bluetuith --help`

```
bluetuith [<flags>]

Config file is /home/zxc/.config/bluetuith/bluetuith.conf

Flags:
  --adapter <adapter>
    	Specify an adapter to use. (For example, hci0)
  --adapter-states [<property>:<state>]
    	Specify adapter states to enable/disable. (For example, 'powered:yes,discoverable:yes,pairable:yes,scan:no')
  --confirm-on-quit
    	Ask for confirmation before quitting the application.
  --connect-bdaddr <address>
    	Specify device address to connect (For example, 'AA:BB:CC:DD:EE:FF')
  --generate
    	Generate configuration.
  --gsm-apn <apn>
    	Specify GSM APN to connect to. (Required for DUN)
  --gsm-number <number>
    	Specify GSM number to dial. (Required for DUN)
  --list-adapters
    	List available adapters.
  --no-help-display
    	Do not display help keybindings in the application.
  --no-warning
    	Do not display warnings when the application has initialized.
  --receive-dir <dir>
    	Specify a directory to store received files.
  --theme
    	Specify a theme in the HJSON format. (For example, '{ Adapter: "red" }')
  --version
    	Print version information.

╔══════════════════════════╤══════════════════════╗
║   Theme Element Types    │     Theme Colors     ║
╟━━━━━━━━━━━━━━━━━━━━━━━━━━┼━━━━━━━━━━━━━━━━━━━━━━╢
║ Adapter                  │ aliceblue            ║
║ AdapterDiscoverable      │ antiquewhite         ║
║ AdapterNotPowered        │ aqua                 ║
║ AdapterPairable          │ aquamarine           ║
║ AdapterPowered           │ azure                ║
║ AdapterScanning          │ beige                ║
║ Background               │ bisque               ║
║ Border                   │ black                ║
║ Device                   │ blanchedalmond       ║
║ DeviceAlias              │ blue                 ║
║ DeviceConnected          │ blueviolet           ║
║ DeviceDiscovered         │ brown                ║
║ DeviceProperty           │ burlywood            ║
║ DevicePropertyConnected  │ cadetblue            ║
║ DevicePropertyDiscovered │ chartreuse           ║
║ DeviceType               │ chocolate            ║
║ Menu                     │ coral                ║
║ MenuBar                  │ cornflowerblue       ║
║ MenuItem                 │ cornsilk             ║
║ ProgressBar              │ crimson              ║
║ ProgressText             │ darkblue             ║
║ StatusError              │ darkcyan             ║
║ StatusInfo               │ darkgoldenrod        ║
║ Text                     │ darkgray             ║
║                          │ darkgreen            ║
║                          │ darkgrey             ║
║                          │ darkkhaki            ║
║                          │ darkmagenta          ║
║                          │ darkolivegreen       ║
║                          │ darkorange           ║
║                          │ darkorchid           ║
║                          │ darkred              ║
║                          │ darksalmon           ║
║                          │ darkseagreen         ║
║                          │ darkslateblue        ║
║                          │ darkslategray        ║
║                          │ darkslategrey        ║
║                          │ darkturquoise        ║
║                          │ darkviolet           ║
║                          │ deeppink             ║
║                          │ deepskyblue          ║
║                          │ dimgray              ║
║                          │ dimgrey              ║
║                          │ dodgerblue           ║
║                          │ firebrick            ║
║                          │ floralwhite          ║
║                          │ forestgreen          ║
║                          │ fuchsia              ║
║                          │ gainsboro            ║
║                          │ ghostwhite           ║
║                          │ gold                 ║
║                          │ goldenrod            ║
║                          │ gray                 ║
║                          │ green                ║
║                          │ greenyellow          ║
║                          │ grey                 ║
║                          │ honeydew             ║
║                          │ hotpink              ║
║                          │ indianred            ║
║                          │ indigo               ║
║                          │ ivory                ║
║                          │ khaki                ║
║                          │ lavender             ║
║                          │ lavenderblush        ║
║                          │ lawngreen            ║
║                          │ lemonchiffon         ║
║                          │ lightblue            ║
║                          │ lightcoral           ║
║                          │ lightcyan            ║
║                          │ lightgoldenrodyellow ║
║                          │ lightgray            ║
║                          │ lightgreen           ║
║                          │ lightgrey            ║
║                          │ lightpink            ║
║                          │ lightsalmon          ║
║                          │ lightseagreen        ║
║                          │ lightskyblue         ║
║                          │ lightslategray       ║
║                          │ lightslategrey       ║
║                          │ lightsteelblue       ║
║                          │ lightyellow          ║
║                          │ lime                 ║
║                          │ limegreen            ║
║                          │ linen                ║
║                          │ maroon               ║
║                          │ mediumaquamarine     ║
║                          │ mediumblue           ║
║                          │ mediumorchid         ║
║                          │ mediumpurple         ║
║                          │ mediumseagreen       ║
║                          │ mediumslateblue      ║
║                          │ mediumspringgreen    ║
║                          │ mediumturquoise      ║
║                          │ mediumvioletred      ║
║                          │ midnightblue         ║
║                          │ mintcream            ║
║                          │ mistyrose            ║
║                          │ moccasin             ║
║                          │ navajowhite          ║
║                          │ navy                 ║
║                          │ oldlace              ║
║                          │ olive                ║
║                          │ olivedrab            ║
║                          │ orange               ║
║                          │ orangered            ║
║                          │ orchid               ║
║                          │ palegoldenrod        ║
║                          │ palegreen            ║
║                          │ paleturquoise        ║
║                          │ palevioletred        ║
║                          │ papayawhip           ║
║                          │ peachpuff            ║
║                          │ peru                 ║
║                          │ pink                 ║
║                          │ plum                 ║
║                          │ powderblue           ║
║                          │ purple               ║
║                          │ rebeccapurple        ║
║                          │ red                  ║
║                          │ rosybrown            ║
║                          │ royalblue            ║
║                          │ saddlebrown          ║
║                          │ salmon               ║
║                          │ sandybrown           ║
║                          │ seagreen             ║
║                          │ seashell             ║
║                          │ sienna               ║
║                          │ silver               ║
║                          │ skyblue              ║
║                          │ slateblue            ║
║                          │ slategray            ║
║                          │ slategrey            ║
║                          │ snow                 ║
║                          │ springgreen          ║
║                          │ steelblue            ║
║                          │ tan                  ║
║                          │ teal                 ║
║                          │ thistle              ║
║                          │ tomato               ║
║                          │ turquoise            ║
║                          │ violet               ║
║                          │ wheat                ║
║                          │ white                ║
║                          │ whitesmoke           ║
║                          │ yellow               ║
║                          │ yellowgreen          ║
╚══════════════════════════╧══════════════════════╝
```

```nix tangle:default.nix
      "bluetuith"
      # keep-sorted end
    ];
  }
)
```
