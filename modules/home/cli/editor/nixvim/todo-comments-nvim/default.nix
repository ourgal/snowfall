{
  path = ./.;
  progs.nixvim.plugins.todo-comments = {
    enable = true;
    colors = {
      error = [
        "DiagnosticError"
        "ErrorMsg"
        "#DC2626"
      ];
      warning = [
        "DiagnosticWarn"
        "WarningMsg"
        "#FBBF24"
      ];
      info = [
        "DiagnosticInfo"
        "#2563EB"
      ];
      hint = [
        "DiagnosticHint"
        "#10B981"
      ];
      default = [
        "Identifier"
        "#7C3AED"
      ];
      test = [
        "Identifier"
        "#FF00FF"
      ];
    };
  };
}
