{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) host;
    in
    {
      path = ./.;
      confs = {
        "pipewire/pipewire.conf.d" = ./sink-eq6.conf;
      };
      value = {
        xdg.configFile = {
          "pipewire/pipewire.conf.d/roc-source.conf".text =
            if (host == "home") then
              ''
                context.modules = [
                  {   name = libpipewire-module-roc-source
                      args = {
                          local.ip = 0.0.0.0
                          resampler.profile = medium
                          fec.code = rs8m
                          sess.latency.msec = 100
                          local.source.port = 10001
                          local.repair.port = 10002
                          source.name = "Roc Source"
                          source.props = {
                             node.name = "roc-source"
                          }
                      }
                  }
                ]
              ''
            else
              "";
          "pipewire/pipewire.conf.d/roc-sink.conf".text =
            if (host != "home") then
              ''
                context.modules = [
                  {   name = libpipewire-module-roc-sink
                      args = {
                          fec.code = rs8m
                          remote.ip = home.local
                          remote.source.port = 10001
                          remote.repair.port = 10002
                          sink.name = "Roc Sink"
                          sink.props = {
                             node.name = "roc-sink"
                          }
                      }
                  }
                ]
              ''
            else
              "";
        };
      };
    }
  )
)
