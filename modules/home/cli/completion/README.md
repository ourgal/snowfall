# cli completion

```nix tangle:default.nix
args:
args.module (
  args
  // {
    path = ./.;
    enable = [
      # keep-sorted start
```

## carapace

Multi-shell multi-command argument completer.
[official site](https://carapace.sh/)
`$ carapace --help`

```
multi-shell multi-command argument completer

Usage:
  carapace [flags] [COMPLETER] [bash|elvish|fish|nushell|oil|powershell|tcsh|xonsh|zsh]

Examples:
  All completers and specs:
    bash:       source <(carapace _carapace bash)
    elvish:     eval (carapace _carapace elvish | slurp)
    fish:       carapace _carapace fish | source
    nushell:    carapace _carapace nushell
    oil:        source <(carapace _carapace oil)
    powershell: carapace _carapace powershell | Out-String | Invoke-Expression
    tcsh:       eval `carapace _carapace tcsh`
    xonsh:      exec($(carapace _carapace xonsh))
    zsh:        source <(carapace _carapace zsh)

  Single completer or spec:
    bash:       source <(carapace chmod bash)
    elvish:     eval (carapace chmod elvish | slurp)
    fish:       carapace chmod fish | source
    nushell:    carapace chmod nushell
    oil:        source <(carapace chmod oil)
    powershell: carapace chmod powershell | Out-String | Invoke-Expression
    tcsh:       eval `carapace chmod tcsh`
    xonsh:      exec($(carapace chmod xonsh))
    zsh:        source <(carapace chmod zsh)

  Style:
    set:        carapace --style 'carapace.Value=bold,magenta'
    clear:      carapace --style 'carapace.Description='

  Bridges:
    set-env CARAPACE_BRIDGES 'zsh,fish,bash,inshellisense'

  Shell parameter is optional and if left out carapace will try to detect it by parent process name.
  Some completions are cached at [/home/zxc/.cache/carapace].
  Config is written to [/home/zxc/.config/carapace].
  Specs are loaded from [/home/zxc/.config/carapace/specs].


Flags:
      --clear-cache   clear caches
      --codegen       generate code for spec file
      --condition     list or execute condition
      --diff          diff completion
  -h, --help          help for carapace
      --list          list completers
      --macro         list or execute macros
      --run           run spec
      --schema        json schema for spec files
      --style         set style
  -v, --version       version for carapace
```

```nix tangle:default.nix
      "carapace"
```

## cod

Tool for generating Bash/Fish/Zsh autocompletions based on --help output.
[github](https://github.com/dim-an/cod/)

```nix tangle:default.nix
      "cod"
```

## tabry

Shell (tab) completion engine
[github](https://github.com/evanbattaglia/tabry-rs)
`$ tabry --help`

```
Tabry tab completion engine

Usage: tabry <COMMAND>

Commands:
  bash      Output completion script for bash Usage in ~/.bash_profile: `source <(tabry bash)` or `source <(tabry bash --no-auto); _tabry_complete_one_command mycmd`
  zsh       Output completion script for zsh Usage in ~/.zsh_profile: `source <(tabry zsh)` or `source <(tabry zsh --no-auto); _tabry_complete_one_command mycmd`
  fish      Output completion script for fish Usage in ~/.config/fish/config.fish: `tabry fish | source` or `tabry fish | source; tabry_completion_init mycmd`
  commands  List commands for which there is a .tabry/.json file in TABRY_IMPORT_PATH
  compile   Compile a tabry file to json (usually done automatically via tabry complete). Usage: tabry compile < [tabry file] > [json file]
  complete  Return completions (usually used via shell script)
  help      Print this message or the help of the given subcommand(s)

Options:
  -h, --help     Print help
  -V, --version  Print version
```

```nix tangle:default.nix
      "tabry"
      # keep-sorted end
    ];
  }
)
```
