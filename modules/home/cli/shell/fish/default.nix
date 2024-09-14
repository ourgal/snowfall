{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args.pkgs) fetchFromGitHub;
    in
    {
      path = ./.;
      progs = {
        fish = {
          shellInit = # fish
            ''
              fish_add_path ~/.local/bin
              fish_add_path ~/.config/emacs/bin
            '';
          interactiveShellInit = # fish
            ''
              set fish_greeting
              scheme set tokyonight
            '';
          shellAbbrs = {
            md = "mkdir -p";
            rd = "rmdir";

            sc = "systemctl";
            scs = "systemctl start";
            sct = "systemctl status";
            scr = "systemctl restart";
            sco = "systemctl stop";

            scu = "systemctl --user";
            scus = "systemctl --user start";
            scut = "systemctl --user status";
            scur = "systemctl --user restart";
            scuo = "systemctl --user stop";

            nms = "nh home switch";
            nos = "nh os switch";
          };
          functions = {
            scroff = {
              body = # fish
                ''
                  if test $XDG_CURRENT_DESKTOP = "Hyprland"
                    hyprctl dispatch dpms off
                  else
                    xset dpms force off
                  end
                '';
              description = "turn screen off";
            };
          };
          plugins = [
            {
              name = "to-fish";
              src = fetchFromGitHub {
                owner = "joehillen";
                repo = "to-fish";
                rev = "52b151cfe67c00cb64d80ccc6dae398f20364938";
                sha256 = "1w77xil5jkbalacbz9c4y8fj0s6kmy1lij22jrc7gncqz99yrw0d";
              };
            }
            {
              name = "fish-color-scheme-switcher";
              src = fetchFromGitHub {
                owner = "h-matsuo";
                repo = "fish-color-scheme-switcher";
                rev = "9f9720dbf06cd4690e6b78c3daa897ae05f792bb";
                sha256 = "1zmlcba9fx9cl7ygraq5wkl10qavgaip2qiryjrfqzld20zs0lzm";
              };
            }
            {
              name = "fish-abbreviation-tips";
              src = fetchFromGitHub {
                owner = "gazorby";
                repo = "fish-abbreviation-tips";
                rev = "8ed76a62bb044ba4ad8e3e6832640178880df485";
                sha256 = "05b5qp7yly7mwsqykjlb79gl24bs6mbqzaj5b3xfn3v2b7apqnqp";
              };
            }
            {
              name = "fish-bd";
              src = fetchFromGitHub {
                owner = "0rax";
                repo = "fish-bd";
                rev = "ab686e028bfe95fa561a4f4e57840e36902d4d7d";
                sha256 = "1zff3lj7pzbv5dai05j7d1a14sqj9c5gy0n39rv4nsqpm6hs7r8r";
              };
            }
            {
              name = "done";
              src = fetchFromGitHub {
                owner = "franciscolourenco";
                repo = "done";
                rev = "eb32ade85c0f2c68cbfcff3036756bbf27a4f366";
                sha256 = "12l7m08bp8vfhl8dmi0bfpvx86i344zbg03v2bc7wfhm20li3hhc";
              };
            }
            {
              name = "autopair.fish";
              src = fetchFromGitHub {
                owner = "ourgal";
                repo = "autopair.fish";
                rev = "ec7ccf41eb945657a829338e85c88ad3353f961a";
                sha256 = "1m7s2csvvj41jsmhfvrgzn4j6q1mv60wjzkn937r4ys7cgrqkkc4";
              };
            }
            {
              name = "puffer-fish";
              src = fetchFromGitHub {
                owner = "nickeb96";
                repo = "puffer-fish";
                rev = "12d062eae0ad24f4ec20593be845ac30cd4b5923";
                sha256 = "06g8pv68b0vyhhqzj469i9rcics67cq1kbhb8946azjb8f7rhy6s";
              };
            }
            {
              name = "fishbang";
              src = fetchFromGitHub {
                owner = "brewingweasel";
                repo = "fishbang";
                rev = "0b5ef82ead524a7dd0da5760d8f677b02b35f654";
                sha256 = "0v5l9m1qcff32ahzcz9ldb2zndx79r1fnif9insbpql27m9m5c81";
              };
            }
            {
              name = "sponge";
              src = fetchFromGitHub {
                owner = "meaningful-ooo";
                repo = "sponge";
                rev = "384299545104d5256648cee9d8b117aaa9a6d7be";
                sha256 = "0p4vk6pq858h2v39c41irrgw1fbbcs7gd9cdr9i9fd3d6i81kmri";
              };
            }
            # {
            #   name = "fifc";
            #   src = fetchFromGitHub {
            #     owner = "gazorby";
            #     repo = "fifc";
            #     rev = "2ee5beec7dfd28101026357633616a211fe240ae";
            #     sha256 = "00f6vklsknnav09abrsfy2m577r30m0pphy0hr86b1w0nnvspdin";
            #   };
            # }
            # {
            #   name = "web-search.fish";
            #   src = fetchFromGitHub {
            #     owner = "veirt";
            #     repo = "web-search.fish";
            #     rev = "6c489c1b0369ebbf8d26505129fe74aa22cd0f03";
            #     sha256 = "0g13pnqzaiwb9rdzvrnbaik4a5i1268yl5lh7zjll47r326dqa72";
            #   };
            # }
            # {
            #   name = "f";
            #   src = fetchFromGitHub {
            #     owner = "gokulsoumya";
            #     repo = "f";
            #     rev = "6099f3a4b5d148674106a264fffc84dd5a4dfe35";
            #     sha256 = "1j6gshbcp9qydlrqx0mqwjpv27avvffgnj2c9zl5dcd34m67haim";
            #   };
            # }
            # {
            #   name = "fish-colored-man";
            #   src = fetchFromGitHub {
            #     owner = "decors";
            #     repo = "fish-colored-man";
            #     rev = "1ad8fff696d48c8bf173aa98f9dff39d7916de0e";
            #     sha256 = "0l32a5bq3zqndl4ksy5iv988z2nv56a91244gh8mnrjv45wpi1ms";
            #   };
            # }
            {
              name = "fzf";
              src = fetchFromGitHub {
                owner = "jethrokuan";
                repo = "fzf";
                rev = "479fa67d7439b23095e01b64987ae79a91a4e283";
                sha256 = "0k6l21j192hrhy95092dm8029p52aakvzis7jiw48wnbckyidi6v";
              };
            }
            {
              name = "gitnow";
              src = fetchFromGitHub {
                owner = "joseluisq";
                repo = "gitnow";
                rev = "91bda1d0ffad2d68b21a1349f9b55a8cb5b54f35";
                sha256 = "0559c5j2gsxdg6g2bmk7qws3x0842g2y55ymd2xf20crcv12psiy";
              };
            }
            {
              name = "ctrl-z";
              src = fetchFromGitHub {
                owner = "kpbaks";
                repo = "ctrl-z.fish";
                rev = "689d60cb9706d2a19cb65286c2dea488b3293807";
                sha256 = "0yczlpalydz870ii0jimx4pi3q8lfl2ak380rqdhpsqgq8d8r81r";
              };
            }
            {
              name = "todo-comments.fish";
              src = fetchFromGitHub {
                owner = "kpbaks";
                repo = "todo-comments.fish";
                rev = "fb818507c2b95e498495fb73206eb101566d71ee";
                sha256 = "0myfyc72kcwjvv0c1yza7wr0xxw949ypg0yfpb0y043cdnm7b867";
              };
            }
            {
              name = "rgg.fish";
              src = fetchFromGitHub {
                owner = "soraxas";
                repo = "rgg.fish";
                rev = "00a852b7d62553b24b8f1bf65d63744ff40c0e5c";
                sha256 = "12a8924naw1wibkd4chrmqx9pa8dk5rs587xvcnihqvbwjh2jd1y";
              };
            }
          ];
        };
      };
      env = {
        FZF_LEGACY_KEYBINDINGS = "0";
        FZF_COMPLETE = "2";
        fifc_keybinding = "\\cx";
      };
      files = [
        { "" = ./.gitnow; }
        { "Downloads/youtube/.keep" = ""; }
      ];
    }
  )
)
