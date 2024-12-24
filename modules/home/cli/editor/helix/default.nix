args:
args.module (
  args
  // (
    let
      inherit (args)
        config
        namespace
        pkgs
        enabled
        enableOpt
        cfgHome
        switch
        ;
      tmuxEnabled = config.${namespace}.cli.multiplexer.tmux.enable;
      zellijEnabled = config.${namespace}.cli.multiplexer.zellij.enable;
      helix-tmux = "${pkgs.${namespace}.helix-tmux}/bin/helix-tmux";
      helix-zellij = "${pkgs.${namespace}.helix-zellij}/bin/helix-zellij";
      tmux-popup = "${pkgs.${namespace}.tmux-popup}/bin/tmux-popup";
      zellij-popup = "${pkgs.${namespace}.zellij-popup}/bin/zellij-popup";
      cfg = cfgHome config.${namespace} ./.;
      toggleBool = pkgs.writeShellScript "toggle_boolean" ''
        awk '{if ($0 ~ /true/) printf "false"; else if ($0 ~ /false/) printf "true";else if ($0 ~ /True/) printf "False"; else if ($0 ~ /False/) printf "True"; else printf $0;}'
      '';

      zellijEnter = "zellij action write 13";
    in
    {
      path = ./.;
      progs = {
        helix = {
          catppuccin = enabled // {
            flavor = "mocha";
            useItalics = true;
          };
          settings = {
            editor =
              enableOpt [
                "true-color"
                "color-modes"
              ]
              // {
                line-number = "relative";
                bufferline = "multiple";
                shell = [
                  "${pkgs.fish}/bin/fish"
                  "-c"
                ];
                idle-timeout = 0;
                popup-border = "none";
                indent-guides = {
                  render = true;
                  character = "⸽"; # Some characters that work well: "▏", "┆", "┊", "⸽"
                  skip-levels = 1;
                };
                statusline = {
                  left = [
                    "mode"
                    "spinner"
                  ];
                  center = [ "file-name" ];
                  right = [
                    "diagnostics"
                    "selections"
                    "position"
                    "file-encoding"
                    "file-line-ending"
                    "file-type"
                  ];
                  separator = "│";
                  mode = {
                    normal = "NORMAL";
                    insert = "INSERT";
                    select = "SELECT";
                  };
                };
                lsp = {
                  display-messages = true;
                  display-inlay-hints = true;
                };
                auto-save = {
                  focus-lost = true;
                  after-delay = {
                    enable = true;
                    timeout = 1000;
                  };
                };
                cursor-shape = {
                  insert = "bar";
                };
                soft-wrap = enabled;
              };
            keys = {
              normal = {
                "]".b = ":buffer-next";
                "[".b = ":buffer-previous";
                "C-h" = "jump_view_left";
                "C-l" = "jump_view_right";
                "C-j" = "jump_view_down";
                "C-k" = "jump_view_up";
                "C-g" =
                  if tmuxEnabled then
                    ":sh ${helix-tmux} lazygit"
                  else if zellijEnabled then
                    ":sh ${helix-zellij} lazygit"
                  else
                    "";
                "G" = "goto_last_line";
                "$" = "goto_line_end";
                "^" = "goto_first_nonwhitespace";
                "0" = "goto_line_start";
                V = "extend_line_below";
                "A-v" = "extend_line_above";
                "esc" = "collapse_selection";
                "Z" = {
                  Z = ":xa";
                  Q = ":qa!";
                };
                g = {
                  "/" =
                    if tmuxEnabled then
                      ":sh ${helix-tmux} search"
                    else if zellijEnabled then
                      ":sh ${helix-zellij} search"
                    else
                      "";
                  z = [
                    "split_selection_on_newline"
                    ":sort"
                    "keep_primary_selection"
                  ];
                  c = {
                    c = "toggle_comments";
                    l = "toggle_line_comments";
                    b = "toggle_block_comments";
                  };
                  e = { };
                  s = { };
                  l = { };
                  h = { };
                  "*" =
                    if tmuxEnabled then
                      [
                        "search_selection"
                        "select_all"
                        "select_regex"
                        ":sh tmux send-key C-m"
                      ]
                    else if zellijEnabled then
                      [
                        "search_selection"
                        "select_all"
                        "select_regex"
                        ":sh ${zellijEnter}"
                      ]
                    else
                      "search_selection";
                };
                "space" = {
                  l = {
                    f = ":fmt";
                  };
                  s = { };
                  S = { };
                  R = { };
                  y = { };
                  Y = { };
                  p = { };
                  P = { };
                  y = { };
                  Y = { };
                  B = ":sh ${helix-tmux} blame";
                  f =
                    if (tmuxEnabled && cfg.broot.enable) then
                      ":sh ${helix-tmux} broot"
                    else if (zellijEnabled && cfg.broot.enable) then
                      ":sh ${helix-zellij} broot"
                    else
                      "file_picker";
                  e =
                    if tmuxEnabled then
                      ":sh ${helix-tmux} lf"
                    else if zellijEnabled then
                      ":sh ${helix-zellij} lf"
                    else
                      "";
                  o = "symbol_picker";
                  O = "workspace_symbol_picker";
                  "/" =
                    if (tmuxEnabled && cfg.live_grep.enable) then
                      ":sh ${tmux-popup} '${helix-tmux} livegrep'"
                    else if (zellijEnabled && cfg.live_grep.enable) then
                      ":sh ${zellij-popup} '${helix-zellij} livegrep'"
                    else
                      "global_search";
                  "*" = [
                    "search_selection"
                    "global_search"
                    ":sh tmux send-key C-m"
                  ];
                  "." = {
                    "." =
                      if tmuxEnabled then
                        [
                          ":wa"
                          ":sh ${helix-tmux} make"
                        ]
                      else if zellijEnabled then
                        [
                          ":wa"
                          ":sh ${helix-zellij} make"
                        ]
                      else
                        "";
                  };
                };
                "C-s" = "select_regex";
                "C-a" = [
                  ":pipe ${toggleBool}"
                  "increment"
                ];
                "C-x" = [
                  ":pipe ${toggleBool}"
                  "decrement"
                ];
              };
              select = {
                "A-d" = "delete_selection";
                G = "goto_file_end";
                "$" = "goto_line_end";
                "^" = "goto_first_nonwhitespace";
                "0" = "goto_line_start";
                "/" = "select_regex";
                "?" = "split_selection";
                "esc" = [
                  "normal_mode"
                  "collapse_selection"
                ];
                g = {
                  z = [
                    "split_selection_on_newline"
                    ":sort"
                    "keep_primary_selection"
                  ];
                  c = "toggle_comments";
                  e = { };
                  s = { };
                  l = { };
                  h = { };
                  "*" =
                    if tmuxEnabled then
                      [
                        "search_selection"
                        "select_all"
                        "select_regex"
                        ":sh tmux send-key C-m"
                      ]
                    else if zellijEnabled then
                      [
                        "search_selection"
                        "select_all"
                        "select_regex"
                        ":sh ${zellijEnter}"
                      ]
                    else
                      "search_selection";
                };
                "space" = {
                  l = {
                    f = ":fmt";
                  };
                  s = { };
                  S = { };
                  R = { };
                  y = { };
                  Y = { };
                  p = { };
                  P = { };
                  y = { };
                  Y = { };
                  B = ":sh ${helix-tmux} blame";
                  f =
                    if (tmuxEnabled && cfg.broot.enable) then
                      ":sh ${helix-tmux} broot"
                    else if (zellijEnabled && cfg.broot.enable) then
                      ":sh ${helix-zellij} broot"
                    else
                      "file_picker";
                  e =
                    if tmuxEnabled then
                      ":sh ${helix-tmux} lf"
                    else if zellijEnabled then
                      ":sh ${helix-zellij} lf"
                    else
                      "";
                  o = "symbol_picker";
                  O = "workspace_symbol_picker";
                  "/" =
                    if (tmuxEnabled && cfg.live_grep.enable) then
                      ":sh ${tmux-popup} ${helix-tmux} livegrep'"
                    else if (zellijEnabled && cfg.live_grep.enable) then
                      ":sh ${zellij-popup} '${helix-zellij} livegrep'"
                    else
                      "global_search";
                  "*" = [
                    "search_selection"
                    "global_search"
                    ":sh tmux send-key C-m"
                  ];
                  "." = {
                    "." =
                      if tmuxEnabled then
                        [
                          ":wa"
                          ":sh ${helix-tmux} make"
                        ]
                      else if zellijEnabled then
                        [
                          ":wa"
                          ":sh ${helix-zellij} make"
                        ]
                      else
                        "";
                  };
                  "C-s" = "select_regex";
                  "C-a" = [
                    ":pipe ${toggleBool}"
                    "increment"
                  ];
                  "C-x" = [
                    ":pipe ${toggleBool}"
                    "decrement"
                  ];
                };
              };
            };
          };
          languages = {
            language = [
              {
                name = "r";
                auto-format = true;
              }
              {
                name = "dhall";
                auto-format = true;
              }
              {
                name = "python";
                auto-format = true;
                scope = "source.python";
                injection-regex = "python";
                file-types = [
                  "py"
                  "pyi"
                  "py3"
                  "pyw"
                  ".pythonstartup"
                  ".pythonrc"
                ];
                shebangs = [ "python" ];
                roots = [
                  "."
                  "pyproject.toml"
                  "pyrightconfig.json"
                ];
                comment-token = "#";
                language-servers = [
                  {
                    name = "ruff-lsp";
                    only-features = [ "format" ];
                  }
                  {
                    name = "pyright";
                    except-features = [ "format" ];
                  }
                  "scls"
                ];
                indent = {
                  tab-width = 4;
                  unit = "    ";
                };
                formatter = {
                  command = pkgs.writeShellScript "helix-ruff-format" ''
                    ruff check --fix - | ruff format -
                  '';
                  args = [ "-" ];
                };
              }
              {
                name = "lua";
                language-servers = [
                  "scls"
                  "lua-language-server"
                ];
                formatter = {
                  command = "stylua";
                  args = [ "-" ];
                };
                auto-format = true;
              }
              {
                name = "toml";
                language-servers = [
                  "scls"
                  "taplo"
                ];
                formatter = {
                  command = "taplo";
                  args = [
                    "fmt"
                    "-"
                  ];
                };
                auto-format = true;
              }
              {
                name = "markdown";
                language-servers = [
                  "scls"
                  "marksman"
                ];
                formatter = {
                  command = "bash";
                  args = [
                    "-c"
                    "prettier --parser markdown | autocorrect --stdin"
                  ];
                };
                auto-format = true;
              }
              {
                name = "nix";
                language-servers = [
                  "scls"
                  "nil"
                  "typos-lsp"
                ];
                formatter = {
                  command = "nixfmt";
                  args = [ "-" ];
                };
                auto-format = true;
              }
              {
                name = "yaml";
                language-servers = [
                  "scls"
                  "yaml-language-server"
                  "ansible-language-server"
                ];
                formatter = {
                  command = "yamlfmt";
                  args = [ "-" ];
                };
                auto-format = true;
              }
              {
                name = "bash";
                language-servers = [
                  "scls"
                  "bash-language-server"
                ];
                formatter = {
                  command = "shfmt";
                  args = [ "-" ];
                };
                auto-format = true;
              }
              {
                name = "c-sharp";
                formatter = {
                  command = "dotnet-csharpier";
                  args = [ "--fast" ];
                };
                auto-format = true;
              }
              {
                name = "jsonnet";
                formatter = {
                  command = "jsonnetfmt";
                  args = [ "-" ];
                };
                auto-format = true;
              }
              {
                name = "perl";
                language-servers = [
                  "scls"
                  "pls"
                ];
                auto-format = true;
              }
              {
                name = "json";
                formatter = {
                  command = "prettier";
                  args = [
                    "--parser"
                    "json"
                  ];
                };
                auto-format = true;
              }
              {
                name = "typst";
                scope = "source.typst";
                injection-regex = "typ";
                comment-token = "//";
                indent = {
                  tab-width = 2;
                  unit = " ";
                };
                roots = [ ];
                text-width = 100;
                rulers = [ 100 ];
                soft-wrap.wrap-at-text-width = true;
                language-servers = [ { name = "typst-lsp"; } ];
                formatter = {
                  command = "typstfmt";
                };
                file-types = [ "typ" ];
                auto-format = true;
              }
              {
                name = "latex";
                formatter = {
                  command = "latexindent";
                  args = [ "-" ];
                };
                auto-format = true;
              }
              {
                name = "c";
                formatter = {
                  command = "clang-format";
                  args = [
                    "--style"
                    "Google"
                    "-"
                  ];
                };
                auto-format = true;
              }
              {
                name = "cue";
                formatter = {
                  command = "cue";
                  args = [
                    "fmt"
                    "-"
                  ];
                };
                auto-format = true;
              }
              {
                name = "nickel";
                formatter = {
                  command = "nickel";
                  args = [ "format" ];
                };
                auto-format = true;
              }
              {
                name = "git-commit";
                language-servers = [
                  "scls"
                  "efm"
                ];
              }
              {
                name = "make";
                language-servers = [
                  "scls"
                  "efm"
                ];
              }
              {
                name = "fish";
                language-servers = [
                  "scls"
                  "fish-lsp"
                ];
                auto-format = true;
              }
              {
                name = "html";
                language-servers = [
                  "scls"
                  "superhtml"
                ];
                auto-format = true;
              }
              {
                name = "cpp";
                language-servers = [
                  "scls"
                  "ccls"
                ];
                formatter = {
                  command = "clang-format";
                  args = [
                    "--style"
                    "Google"
                    "-"
                  ];
                };
                auto-format = true;
              }
              {
                name = "ruby";
                language-servers = [
                  "scls"
                  "solargraph"
                ];
                formatter = {
                  command = "rubyfmt";
                };
                auto-format = true;
              }
              {
                name = "haskell";
                auto-format = true;
              }
            ];
            language-server = {
              pyright = {
                command = "pyright-langserver";
                args = [ "--stdio" ];
                config = {
                  reportMissingTypeStubs = false;
                  python.analysis = {
                    typeCheckingMode = "basic";
                    autoImportCompletions = true;
                  };
                };
              };
              ruff = {
                command = "ruff-lsp";
                config = {
                  documentFormatting = true;
                  settings.run = "onSave";
                };
              };
              yaml-language-server.config.yaml = {
                format = enabled;
                validation = true;
                schemas = {
                  "https://json.schemastore.org/github-workflow.json" = ".github/workflows/*.{yml,yaml}";
                  "https://raw.githubusercontent.com/ansible-community/schemas/main/f/ansible-tasks.json" = "roles/{tasks,handlers}/*.{yml,yaml}";
                };
              };
              scls = {
                command = "simple-completion-language-server";
                config =
                  enableOpt [
                    "snippets_first" # completions will return before snippets by default
                    "feature_words" # enable completion by word
                    "feature_snippets" # enable snippets
                    "feature_unicode_input" # enable "unicode input"
                    "feature_paths"
                  ]
                  // {
                    max_completion_items = 20; # set max completion results len for each group: words, snippets, unicode-input
                  };
                environment = {
                  RUST_LOG = "info,simple-completion-langauge-server=info";
                  LOG_FILE = "/tmp/completion.log";
                };
              };
              biome = {
                command = "biome";
                args = [ "lsp-proxy" ];
              };
              typst-lsp = {
                command = "typst-lsp";
              };
              nixd = {
                command = "nixd";
                config = {
                  formatting = {
                    command = [
                      "nixfmt"
                      "-"
                    ];
                  };
                  nixpkgs = {
                    expr = "import <nixpkgs> {}";
                  };
                };
              };
              efm = {
                command = "efm-langserver";
              };
              pls = {
                command = "pls";
              };
              perlls = {
                command = "perl";
                args = [
                  "-MPerl::LanguageServer"
                  "-e"
                  "Perl::LanguageServer::run"
                  "--"
                  "--port"
                  "13603"
                ];
              };
              typos-lsp = {
                command = "typos-lsp";
              };
              fish-lsp = {
                command = "fish-lsp";
                args = [ "start" ];
              };
              superhtml = {
                command = "superhtml";
                args = [ "lsp" ];
              };
              ccls = {
                command = "ccls";
              };
            };
          };
        };
      };
      myPkgs = [
        "simple-completion-language-server"
        "live-grep"
      ];
      confs = {
        "helix/external-snippets.toml" = {
          "sources" = [
            {
              "git" = "https://github.com/rafamadriz/friendly-snippets.git";
              "name" = "friendly-snippets";
              "paths" = [
                {
                  "path" = "snippets/python/python.json";
                  "scope" = [ "python" ];
                }
                {
                  "path" = "snippets/make.json";
                  "scope" = [ "make" ];
                }
                {
                  "path" = "snippets/nix.json";
                  "scope" = [ "nix" ];
                }
                {
                  "path" = "snippets/markdown.json";
                  "scope" = [ "markdown" ];
                }
                {
                  "path" = "snippets/fennel.json";
                  "scope" = [ "fennel" ];
                }
                {
                  "path" = "snippets/perl.json";
                  "scope" = [ "perl" ];
                }
              ];
            }
          ];
        };
        "helix/external-snippets/github.com/rafamadriz/friendly-snippets.git" =
          pkgs._sources.friendly-snippets.src;
      };
      extraOpts = {
        broot = switch;
        live_grep = switch;
      };
    }
  )
)
