# cryptocurrency

```nix tangle:default.nix
args:
args.module (
  args
  // {
    path = ./.;
```

## cointop

Fastest and most interactive terminal based UI application for tracking cryptocurrencies.
[github](https://cointop.sh/)
`$ cointop --help`

```
           _       _
  ___ ___ (_)_ __ | |_ ___  _ __
 / __/ _ \| | '_ \| __/ _ \| '_ \
| (_| (_) | | | | | || (_) | |_) |
 \___\___/|_|_| |_|\__\___/| .__/
                           |_|

Cointop is a fast and lightweight interactive terminal based UI application for tracking and monitoring cryptocurrency coin stats in real-time.

See git.io/cointop for more info.

Usage:
  cointop [flags]
  cointop [command]

Available Commands:
  clean       Clear the cache
  completion  generate the autocompletion script for the specified shell
  dominance   Displays bitcoin dominance
  help        Help about any command
  holdings    Displays current holdings
  price       Displays the current price of coin(s)
  reset       Resets the config and clear the cache
  server      Run cointop SSH Server
  test        Runs tests for Homebrew
  version     Displays the current version

Flags:
      --api string                     API choice. Available choices are "coinmarketcap" and "coingecko"
      --cache-dir string               Cache directory (default :PREFERRED_CACHE_HOME:/cointop)
      --clean                          Wipe clean the cache
      --coinmarketcap-api-key string   Set the CoinMarketCap API key
      --colors-dir string              Colorschemes directory
      --colorscheme string             Colorscheme to use (default "cointop").
                                       To install standard themes, do:

                                       git clone git@github.com:cointop-sh/colors.git /home/zxc/.config/cointop/colors

                                       See git.io/cointop#colorschemes for more info.
  -c, --config string                  Config filepath. (default /home/zxc/.config/cointop/config.toml)
  -h, --help                           help for cointop
      --hide-chart                     Hide the chart view
      --hide-marketbar                 Hide the top marketbar
      --hide-portfolio-balances        Hide portfolio balances. Useful for when sharing screen or taking screenshots
      --hide-statusbar                 Hide the bottom statusbar
      --hide-table                     Hide the table view
      --max-pages uint                 Max number of pages (default 10)
      --no-cache                       No cache
      --only-chart                     Show only the chart. Hides the table and top and bottom bars
      --only-table                     Show only the table. Hides the chart and top and bottom bars
      --per-page uint                  Per page (default 100)
  -r, --refresh-rate uint              Refresh rate in seconds. Set to 0 to not auto-refresh (default 60)
      --reset                          Reset the config. Make sure to backup any relevant changes first!
  -s, --silent                         Silence log ouput
      --test                           Run test (for Homebrew)
  -v, --version                        Display current version

Use "cointop [command] --help" for more information about a command.
```

```nix tangle:default.nix
    nixPkgs = "cointop";
  }
)
```
