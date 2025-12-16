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
          pkgs.nix-vscode-extensions.vscode-marketplace.mattiasbaake.vscode-snippets-for-ansible
        ];
      };
    }
  )
)
