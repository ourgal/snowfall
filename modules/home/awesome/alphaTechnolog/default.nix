{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      "jetbrains-mono"
      "product-sans"
    ];
    confs = {
      awesome = [
        ./rc.lua
        ./theme.lua
        ./helpers.lua
        ./autocorrect.lua
        ./user_likes.lua
        ./assets
        ./bling
        ./configuration
        ./scripts
        ./signal
        ./ui
      ];
    };
  }
)
