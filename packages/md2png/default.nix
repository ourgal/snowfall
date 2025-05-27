{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "md2png";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "weaming";
    repo = "md2png";
    rev = "v${version}";
    hash = "sha256-u+KDMYdpiAhH6NvS0N6ATO4oy9otxvnXK7Q0mJFFdZY=";
  };

  env = {
    GO111MODULE = "on";
    GOPROXY = "https://goproxy.cn";
  };

  vendorHash = "sha256-jzCzK//pw7AAra5JBVmjUn3DPJzU9e+Nof/LqapEwjA=";

  postPatch = ''
    cp ${./go.mod} go.mod
    cp ${./go.sum} go.sum
  '';

  meta = {
    description = "Render markdown file to PNG image. Support custom CSS URL/file";
    homepage = "https://github.com/weaming/md2png";
    license = lib.licenses.unfree; # FIXME: nix-init did not find a license
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "md2png";
    platforms = lib.platforms.all;
  };
}
