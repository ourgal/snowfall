args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule mkPodmanOpts;
  name = "alist";
  port = 5244;
  src = lib.${namespace}.sources."docker-${name}";
  dataDir = "/var/lib/${name}";
  value = {
    virtualisation.oci-containers.containers.${name} = {
      image = "${src.src.imageName}:${src.version}";
      ports = [ (toString port) ];
      volumes = [ "${dataDir}:/opt/alist/data" ];
    };
  };
  path = ./.;
  extraOpts = mkPodmanOpts { ports = port; };
  _args = {
    inherit
      value
      path
      args
      extraOpts
      ;
  };
in
nixosModule _args
