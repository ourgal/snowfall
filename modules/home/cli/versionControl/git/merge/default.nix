args:
args.module (
  args
  // (
    let
      inherit (args) pkgs namespace;
      gitattributes =
        (pkgs.runCommand "mergiraf-gitattributes" { nativeBuildInputs = [ pkgs.${namespace}.mergiraf ]; } ''
          mkdir $out
          mergiraf languages --gitattributes > $out/gitattributes
        '')
        + "/gitattributes";
    in
    {
      path = ./.;
      myPkgs = "mergiraf";
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
