args:
args.module (
  args
  // (
    let
      inherit (args) pkgs config host;
      pub_key =
        if host == "home" then
          "AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBKXfKLJn7V0doSMw/B9c06hHuC4QyUoqXBeHOVBSUzikK8Mx05KTZ/vP56oRLufycEWh231UlRNNT/tAJxUGXG4="
        else if host == "surface" then
          "AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBDBx6/001Eq2UKfcxM+oJyBUzcnMeT4yEZ+nO8YLEs/YBvmFlsT0cEiA4C0H4YToKrfGAQO6fP1vsp1AibgvCJU="
        else
          builtins.throw "no public key for host";
      allowed_signers = pkgs.writeText "allowed_signers" ''
        git@fairever.aleeas.com namespaces="git" ecdsa-sha2-nistp256 ${pub_key} zxc@${host}
      '';
    in
    {
      progs.git = {
        signing = {
          signByDefault = true;
          key = "${config.home.homeDirectory}/.ssh/id_ecdsa.pub";
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
