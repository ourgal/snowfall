{
  nixPkgs = "lla";
  confs."lla/config.toml" = {
    "default_depth" = 3;
    "default_format" = "long";
    "default_sort" = "name";
    "filter" = {
      "case_sensitive" = false;
      "no_dotfiles" = false;
    };
    "formatters" = {
      "grid" = {
        "ignore_width" = false;
        "max_width" = 200;
      };
      "tree" = {
        "max_lines" = 20000;
      };
    };
    "include_dirs" = false;
    "listers" = {
      "fuzzy" = {
        "ignore_patterns" = [
          "node_modules"
          "target"
          ".git"
          ".idea"
          ".vscode"
        ];
      };
      "recursive" = {
        "max_entries" = 20000;
      };
    };
    "show_icons" = true;
    "sort" = {
      "case_sensitive" = false;
      "dirs_first" = true;
      "natural" = true;
    };
    "theme" = "tokyo_night";
    enabled_plugins = [ ];
    plugins_dir = "~/.config/lla/plugins";
  };
}
