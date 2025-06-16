{
  nixPkgs = "lefthook";
  confs."lefthook/lefthook.yml" = {
    output = false;
    pre-commit = {
      jobs = [
        {
          name = "default";
          group = {
            parallel = true;
            jobs = [
              {
                name = "toml";
                glob = "*.toml";
                run = "taplo fmt {staged_files}";
                stage_fixed = true;
              }
              {
                name = "json";
                glob = "*.json";
                run = "fixjson -w {staged_files}";
                stage_fixed = true;
              }
              {
                name = "yaml";
                exclude = "lefthook.yml";
                glob = "*.{yaml,yml}";
                run = "yamlfix {staged_files}";
                stage_fixed = true;
              }
              {
                name = "lua";
                glob = "*.lua";
                run = "stylua {staged_files}";
                stage_fixed = true;
              }
              {
                name = "fennel";
                glob = "*.fnl";
                run = "fnlfmt --fix {staged_files}";
                stage_fixed = true;
              }
              {
                name = "markdown";
                glob = "*.md";
                run = "prettier --parser markdown --write {staged_files} && autocorrect --fix --quiet {staged_files}";
                stage_fixed = true;
              }
              {
                name = "bash";
                glob = "*.sh";
                run = "shfmt -s -w {staged_files}";
                stage_fixed = true;
              }
              {
                name = "go";
                glob = "*.go";
                run = "gofmt -w {staged_files}";
                stage_fixed = true;
              }
              {
                name = "justfile";
                glob = "justfile";
                run = "just --fmt --unstable -f {staged_files}";
                stage_fixed = true;
              }
              {
                name = "nix";
                glob = "*.nix";
                run = "nixfmt --strict {staged_files}";
                stage_fixed = true;
              }
              {
                name = "python";
                glob = "*.py";
                run = "ruff check --fix {staged_files} && ruff format {staged_files}";
                stage_fixed = true;
              }
              {
                name = "makefile";
                glob = "Makefile";
                run = "checkmake {staged_files}";
              }
              {
                name = "editorconfig";
                glob = ".editorconfig";
                run = "validator {staged_files}";
              }
            ];
          };
        }
        {
          name = "nix";
          group = {
            jobs = [
              {
                name = "deadnix";
                glob = "*.nix";
                run = "deadnix -eq {staged_files}";
                stage_fixed = true;
              }
              {
                name = "keep-sorted";
                glob = "*.nix";
                run = "keep-sorted --mode fix {staged_files}";
                stage_fixed = true;
              }
            ];
          };
        }
        {
          name = "python";
          group = {
            jobs = [
              {
                name = "pyupgrade";
                glob = "*.py";
                run = "pyupgrade --py312-plus {staged_files}";
                stage_fixed = true;
              }
              {
                name = "uv-sort";
                glob = "pyproject.toml";
                run = "uv-sort {staged_files}";
                stage_fixed = true;
              }
            ];
          };
        }
        {
          name = "whitespace";
          group = {
            jobs = [
              {
                exclude = "*.{gpg,png,jpg,jpeg,webp,gif,dat,age,mp3,mp4,mkv,ttf,ico,xcf,ogg,zip,tar.gz}";
                file_types = "text";
                run = ''
                  whitespace-format --remove-trailing-whitespace --remove-trailing-empty-lines {staged_files}
                '';
                stage_fixed = true;
              }
            ];
          };
        }
        {
          name = "config-file-validator";
          group = {
            jobs = [
              {
                glob = "*.{xml,csv,ini,json,toml,yaml,yml}";
                run = "validator {staged_files}";
              }
            ];
          };
        }
        {
          name = "check-secrets";
          group = {
            jobs = [ { run = "gitleaks protect -v --staged"; } ];
          };
        }
      ];
    };
    commit-msg = {
      jobs = [
        {
          group = {
            jobs = [
              {
                name = "commitmsgfmt";
                run = "commitmsgfmt-wrapper {1}";
              }
              {
                name = "commitizen";
                run = "cz check --commit-msg-file {1}";
              }
            ];
          };
        }
      ];
    };
  };
}
