{
  path = ./.;
  progs.nixvim.plugins.dap = {
    enable = true;
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
      dap-python.enable = true;
      dap-ui = {
        enable = true;
        floating.mappings = {
          close = [
            "<ESC>"
            "q"
          ];
        };
      };
      dap-virtual-text.enable = true;
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
}
