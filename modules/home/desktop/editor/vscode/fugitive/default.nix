args:
args.module (
  args
  // (
    let
      inherit (args) pkgs lib namespace;
      inherit (lib.${namespace}.sources) vsc-fugitive;
      fugitive = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "vscode-fugitive";
          publisher = "hnrk-str";
          inherit (vsc-fugitive) version;
          inherit (vsc-fugitive.src) sha256;
        }
      ];
    in
    {
      progs.vscode.profiles.default.extensions = fugitive;
    }
  )
)
