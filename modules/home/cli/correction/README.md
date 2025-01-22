# cli correction

```nix tangle:default.nix
args:
args.module (
  args
  // {
    path = ./.;
    enable = [
      # keep-sorted start
```

## pay-respects

Terminal command correction, alternative to thefuck, written in Rust.
[github](https://codeberg.org/iff/pay-respects)
`$ pay-respects --help`

```
Usage: pay-respects [your shell] [--alias [alias]]

Example 1, manual aliasing: `pay-respects bash`

The command will output the command that you can use to execute the binary with
the correct environment. You can alias such output to a shorter key. Such as
`alias f=$(pay-respects bash)`)

Example 2, auto aliasing: `pay-respects bash --alias f`

The command will output a declaration that can be directly embedded in your
config file with `eval $(pay-respects bash --alias f)`. For fish, use
`pay-respects fish --alias | source` instead.

```

```nix tangle:default.nix
      "pay-respects"
```

## thefuck

Magnificent app which corrects your previous console command.
[github](https://github.com/nvbn/thefuck)

```nix tangle:default.nix
      "thefuck"
      # keep-sorted end
    ];
  }
)
```
