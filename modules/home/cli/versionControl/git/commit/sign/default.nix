args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
      allowed_signers = pkgs.writeText "allowed_signers" ''
        git@fairever.aleeas.com namespaces="git" ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBKXfKLJn7V0doSMw/B9c06hHuC4QyUoqXBeHOVBSUzikK8Mx05KTZ/vP56oRLufycEWh231UlRNNT/tAJxUGXG4= zxc@home
      '';
    in
    {
      progs.git = {
        signing = {
          signByDefault = true;
          key = "~/.ssh/id_ecdsa.pub";
        };
        extraConfig = {
          gpg = {
            format = "ssh";
            ssh.allowedSignersFile = toString allowed_signers;
          };
        };
      };
    }
  )
)
