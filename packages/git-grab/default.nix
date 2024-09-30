{ lib
, rustPlatform
, fetchFromGitHub
}:

rustPlatform.buildRustPackage rec {
  pname = "git-grab";
  version = "3.0.0";

  src = fetchFromGitHub {
    owner = "wezm";
    repo = "git-grab";
    rev = version;
    hash = "sha256-MsJDfmWU6LyK7M0LjYQufIpKmtS4f2hgo4Yi/x1HsrU=";
  };

  cargoHash = "sha256-0HZ27rMA2d+roxxl6mYs9vuIWKAXct/6NezuOILs8p0=";

  meta = with lib; {
    description = "Clone a git repository into a standard location organised by domain and path";
    homepage = "https://github.com/wezm/git-grab";
    license = with licenses; [ asl20 mit ];
    maintainers = with maintainers; [ ];
    mainProgram = "git-grab";
  };
}
