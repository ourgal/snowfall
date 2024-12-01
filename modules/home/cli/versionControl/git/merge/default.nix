args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
      gitattributes =
        (pkgs.runCommand "mergiraf-gitattributes" { nativeBuildInputs = [ pkgs.mergiraf ]; } ''
          mkdir $out
          mergiraf languages --gitattributes > $out/gitattributes
        '')
        + "/gitattributes";
    in
    {
      path = ./.;
      nixPkgs = "mergiraf";
      progs.git.extraConfig = {
        merge.mergiraf = {
          name = "mergiraf";
          driver = "mergiraf merge --git %O %A %B -s %S -x %X -y %Y -p %P";
        };
        core.attributesfile = "~/.gitattributes";
      };
      value = {
        home.file.".gitattributes".source = gitattributes;
      };
    }
  )
)
