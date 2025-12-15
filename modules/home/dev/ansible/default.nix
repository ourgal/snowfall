args:
args.module (
  args
  // (
    let
      inherit (args) namespace;
    in
    {
      myPkgs = "ansible-language-server";
      nixPkgs = [
        # keep-sorted start
        "ansible"
        "ansible-lint"
        # keep-sorted end
      ];
      value = {
        ${namespace} = {
          dev.python.global.pkgs = p: [ p.ansible ];
        };
      };
    }
  )
)
