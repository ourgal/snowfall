{
  lib,
  buildGoModule,
  _sources',
  namespace,
}:
let
  source = _sources' ./.;
in
buildGoModule (
  lib.${namespace}.mkGoSource source
  // {
    sourceRoot = "${source.src.name}/src/cli";

    vendorHash = "sha256-kzMvksDjhqKlHvBwl0spOApFKHKM7lm0WG2hifP6+Ro=";

    meta = with lib; {
      description = "Post tweets from terminal";
      homepage = "https://github.com/devhindo/x";
      license = licenses.mit;
      maintainers = with maintainers; [ zxc ];
      mainProgram = "x";
      platforms = platforms.all;
    };
  }
)
