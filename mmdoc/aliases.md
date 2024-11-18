# Aliases {#aliases}

## home-manager

| origin                                          | alias              |
| ----------------------------------------------- | ------------------ |
| `home.packages = with pkgs; []`                 | `nixPkgs = ""`     |
| `home.packages = with pkgs.${namespace}; []`    | `myPkgs = ""`      |
| `home.packages = with pkgs.nodePackages; []`    | `nodePkgs = ""`    |
| `home.packages = with pkgs.pythonPackages; []`  | `pyPkgs = ""`      |
| `home.packages = with pkgs.dotnetPackages; []`  | `dotnetPkgs = ""`  |
| `home.packages = with pkgs.perlPackages; []`    | `perlPkgs = ""`    |
| `home.packages = with pkgs.luaPackages; []`     | `luaPkgs = ""`     |
| `home.packages = with pkgs.haskellPackages; []` | `haskellPkgs = ""` |
| `home.packages = with pkgs.xorg; []`            | `xorgPkgs = ""`    |
| `home.packages = with pkgs.xfce; []`            | `xfcePkgs = ""`    |
| `home.packages = with pkgs.gnome; []`           | `gnomePkgs = ""`   |
| `home.packages = with pkgs.snowfallorg; []`     | `snowPkgs = ""`    |
| `home.packages = with pkgs.nvtopPackages; []`   | `nvtopPkgs = ""`   |
| `home.packages = with inputs; []`               | `inputs = ""`      |
| `home.file = {}`                                | `files = {}`       |
| `xdg.configFile = {}`                           | `confs = {}`       |
| `xdg.dataFile = {}`                             | `dataFiles = {}`   |
| `sessionVariables = {}`                         | `env = {}`         |
| `programs = {}`                                 | `progs = {}`       |
| `services = {}`                                 | `servs = {}`       |
| `cfg.x.enable = true`                           | `enable = [ "x" ]` |

```nix
nixPkgs = "a";
# or
nixPkgs = [ "a" ]
# or
nixPkgs = p: [ p.a ]
```

```nix
progs = "a";
# =>
programs.a.enable = true
```

```nix
progs.a.settings = true;
# =>
programs.a = { enable = true; settings = true; };

servs = [ "a" { b.settings = true; } ];
# =>
services.a = { enable = true; };
services.b = { enable = true; settings = true; };
```

```nix
files.".text" = "text";
# =>
home.file = { ".text".text = "text"; };
```

```nix
confs."atuin" = ./config.toml;
# =>
xdg.configFile = { "atuin/config.toml".source = ./config.toml; };
```
