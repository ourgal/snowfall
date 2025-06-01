args:
args.module (
  args
  // (
    let
      inherit (args) pkgs lib;
    in
    {
      progs = {
        scmpuff.enableAliases = false;
        bash.initExtra =
          let
            scmpuffInit = "${lib.getExe pkgs.scmpuff} init --shell=bash";
          in
          ''
            eval "$(head -n $(($(${scmpuffInit} | wc -l) - 7)) <(${scmpuffInit}))"
          '';
        zsh.initContent =
          let
            scmpuffInit = "${lib.getExe pkgs.scmpuff} init --shell=zsh";
          in
          ''
            eval "$(head -n $(($(${scmpuffInit} | wc -l) - 7)) <(${scmpuffInit}))"
          '';
        fish = {
          interactiveShellInit = # fish
            ''
              function __cut_last_few_lines
                  set -l str_array (string split "\n" $argv[1..-2])
                  set -l last_linenum $argv[-1]

                  echo -e (string join "\n" $str_array[1..$last_linenum])
              end

              __cut_last_few_lines (${lib.getExe pkgs.scmpuff} init --shell=fish) -8 | source
            '';
          functions.gl = {
            body = ''git log --graph --all --pretty=format:"%C(magenta)%h %C(white) %an  %ar%C(blue)  %D%n%s%n"'';
          };
        };
      };
    }
  )
)
