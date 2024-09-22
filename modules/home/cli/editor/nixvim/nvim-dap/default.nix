{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) enabled;
    in
    {
      path = ./.;
      progs = {
        nixvim = {
          plugins = {
            dap = enabled // {
              signs = {
                dapBreakpoint = {
                  text = "●";
                  texthl = "DapBreakpoint";
                };
                dapBreakpointCondition = {
                  text = "●";
                  texthl = "DapBreakpointCondition";
                };
                dapLogPoint = {
                  text = "◆";
                  texthl = "DapLogPoint";
                };
              };
              extensions = {
                dap-python = enabled;
                dap-ui = enabled // {
                  floating.mappings = {
                    close = [
                      "<ESC>"
                      "q"
                    ];
                  };
                };
                dap-virtual-text = enabled;
              };
              configurations = {
                java = [
                  {
                    type = "java";
                    request = "launch";
                    name = "Debug (Attach) - Remote";
                    hostName = "127.0.0.1";
                    port = 5005;
                  }
                ];
              };
            };
          };
        };
      };
    }
  )
)
