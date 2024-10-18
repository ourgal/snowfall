args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "gtm";
    progs.fish = {
      interactiveShellInit = "__gtm";
      functions.__gtm = {
        body = ''
          ;
          function __gtm --on-event fish_prompt
              gtm record -terminal
          end
        '';
        description = "gtm terminal hook";
      };
    };
  }

)
