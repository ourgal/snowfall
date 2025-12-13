args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      progs.vscode.profiles.default = {
        extensions = [
          pkgs.open-vsx.redhat.ansible
          pkgs.open-vsx.redhat.vscode-yaml
          pkgs.open-vsx.ms-python.python
        ];
      };
    }
  )
)
