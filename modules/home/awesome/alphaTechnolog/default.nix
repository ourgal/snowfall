{
  myPkgs = [
    "jetbrains-mono"
    "product-sans"
  ];
  confs = {
    awesome = [
      ./rc.lua
      ./theme.lua
      ./helpers.lua
      ./user_likes.lua
      ./assets
      ./configuration
      ./scripts
      ./signal
      ./ui
    ];
  };
}
