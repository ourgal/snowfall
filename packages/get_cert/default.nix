{
  curl,
  gawk,
  pkgs,
  ...
}:
pkgs.pog.pog {
  name = "get_cert";
  version = "0.1.0";

  runtimeInputs = [
    curl
    gawk
  ];

  script = ''
    curl --insecure -I -vvv "$1" 2>&1 | awk 'BEGIN { cert=0 } /^\* SSL connection/ { cert=1 } /^\*/ { if (cert) print }'
  '';
}
