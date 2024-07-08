{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "cookiecutter";
    files = {
      ".cookiecutterrc" = ''
        default_context:
            name: "ourgal"
            full_name: "ourgal"
            email: "git@fairever.aleeas.com"
        abbreviations:
            my: http://git.zxc.cn/cookiecutter-{0}
      '';
    };
  }
)
