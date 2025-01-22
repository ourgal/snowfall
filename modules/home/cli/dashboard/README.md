# cli dashboard

```nix tangle:default.nix
args:
args.module (
  args
  // {
    path = ./.;
```

## wtf

Personal information dashboard for your terminal.
[github](https://wtfutil.com/)
`$ wtfutil --help`

```
Usage:
  wtfutil [OPTIONS] [command] [args...]

Application Options:
  -c, --config=  Path to config file
  -m, --module=  Display info about a specific module, i.e.: 'wtfutil -m=todo'
  -p, --profile  Profile application memory usage
  -v, --version  Show version info

Help Options:
  -h, --help     Show this help message


Commands:
  save-secret <service>
    service      Service URL or module name of secret.
  Save a secret into the secret store. The secret will be prompted for.
  Requires wtf.secretStore to be configured.  See individual modules for
  information on what service and secret means for their configuration,
  not all modules use secrets.

```

```nix tangle:default.nix
    nixPkgs = "wtf";
  }
)
```
