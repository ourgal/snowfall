args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      path = ./.;
      nixPkgs = [
        "ctpv"
        "ueberzugpp"
      ];
      confs = [
        {
          lf = [
            ./colors
            ./icons
          ];
        }
        {
          "ctpv/config" = ''
            preview lua .lua {{
              bat --force-colorization --paging=never --plain --terminal-width $(($2 - 3)) "$f"
            }}
          '';
        }
      ];
      progs = [
        {
          lf = {
            settings = {
              icons = true;
              dircounts = true;
              shell = "bash";
              info = "size";
              period = 1;
              scrolloff = 10;
              ignorecase = "true";
              previewer = "${pkgs.ctpv}/bin/ctpv";
              cleaner = "${pkgs.ctpv}/bin/ctpvclear";
              shellopts = "-eu";
              ifs = "\\n";
              cursorpreviewfmt = "\\033[7;2m";
            };
            extraConfig = ''
              &${pkgs.ctpv}/bin/ctpv -s $id
              &${pkgs.ctpv}/bin/ctpvquit $id
              setlocal /home/zxc/workspace/linovel/patches/ sortby time
              setlocal /home/zxc/workspace/linovel/patches/ reverse

              setlocal /home/zxc/workspace/linovel/ sortby time
              setlocal /home/zxc/workspace/linovel/ reverse

              setlocal /home/zxc/Downloads/ sortby time
              setlocal /home/zxc/Downloads/ reverse

              $mkdir -p ~/.trash
            '';

            commands = {
              go_to_git_root = # bash
                ''
                  ''${{
                      lf -remote "send $id cd \"$(git rev-parse --show-toplevel)\""
                  }}'';
              num_toggle = # bash
                ''
                  %{{
                      set +e
                      if [ $# -eq 1 ] && [[ $1 -eq $1 ]]; then
                          for ((i=1; i<=$1; i++))
                          do
                              lf -remote "send $id toggle"
                              lf -remote "send $id down"
                          done
                      fi
                  }}'';
              open = # bash
                ''
                  &{{
                      case $(file --mime-type -Lb $f) in
                          text/*) lf -remote "send $id \$$EDITOR \$fx";;
                          *) for f in $fx; do $OPENER $f > /dev/null 2> /dev/null & done;;
                      esac
                  }}'';
              new-folder = # bash
                ''
                  %{{
                      IFS=" "
                      printf "new folder name: ";
                      read name;
                      mkdir -p "$name"
                      lf -remote "send $id select \"$name\""
                  }}'';
              new-file = # bash
                ''
                  %{{
                      IFS=" "
                      printf "new file name: ";
                      read name;
                      touch "$name"
                      lf -remote "send $id select \"$name\""
                  }}'';
              trash = "%set -f; mv $fx ~/.trash";
              delete = # bash
                ''
                  %{{
                      printf "delete? [y/n] "
                      read ans
                      [ "$ans" = "y" ] && rm -rf $fx
                  }}'';
              extract = # bash
                ''
                  ''${{
                      set -f
                      case $f in
                          *.tar.bz|*.tar.bz2|*.tbz|*.tbz2) tar xjvf $f;;
                          *.tar.gz|*.tgz) tar xzvf $f;;
                          *.tar.xz|*.txz) tar xJvf $f;;
                          *.zip) unzip $f;;
                          *.rar) unrar x $f;;
                          *.7z) 7z x $f;;
                      esac
                  }}'';
              tar = # bash
                ''
                  ''${{
                      set -f
                      clear;
                      printf "tar file name: ";
                      read name;
                      mkdir $name
                      cp -r $fx $name
                      tar czf $name.tar.gz $name
                      rm -rf $name
                      lf -remote "send $id unselect"
                  }}'';
              zip = # bash
                ''
                  ''${{
                      set -f
                      clear;
                      printf "zip file name: ";
                      read name;
                      mkdir $name
                      cp -r $fx $name
                      zip -r $name.zip $name
                      rm -rf $name
                      lf -remote "send $id unselect"
                  }}'';
              "7z" = # bash
                ''
                  ''${{
                      set -f
                      clear;
                      printf "7z file name: ";
                      read name;
                      mkdir $name
                      cp -r $fx $name
                      7z a $name.7z $name
                      rm -rf $name
                      lf -remote "send $id unselect"
                  }}'';
              z = # bash
                ''
                  %{{
                  	result="$(zoxide query --exclude $PWD $@ | sed 's/\\/\\\\/g;s/"/\\"/g')"
                  	lf -remote "send $id cd \"$result\""
                  }}'';
              zi = # bash
                ''
                  ''${{
                  	result="$(zoxide query -i | sed 's/\\/\\\\/g;s/"/\\"/g')"
                  	lf -remote "send $id cd \"$result\""
                  }}'';
              on-select = # bash
                ''
                  &{{
                      lf -remote "send $id set statfmt \"$(eza -ld --color=always "$f")\""
                  }}'';
              fzf_jump = # bash
                ''
                  ''${{
                      res="$(fd . | fzf --header='Jump to location')"
                      if [ -n "$res" ]; then
                          if [ -d "$res" ]; then
                              cmd="cd"
                          else
                              cmd="select"
                          fi
                          res="$(printf '%s' "$res" | sed 's/\\/\\\\/g;s/"/\\"/g')"
                          lf -remote "send $id $cmd \"$res\""
                      fi
                  }}'';
              fzf_search = # bash
                ''
                  ''${{
                      RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case "
                      res="$(
                          FZF_DEFAULT_COMMAND="$RG_PREFIX '''" \
                              fzf --bind "change:reload:$RG_PREFIX {q} || true" \
                              --ansi --layout=reverse --header 'Search in files' \
                              | cut -d':' -f1 | sed 's/\\/\\\\/g;s/"/\\"/g'
                      )"
                      [ -n "$res" ] && lf -remote "send $id select \"$res\""
                  }}'';
              convert_to_mp3 = # bash
                ''
                  ''${{
                     clear;
                     set -f;

                     #Variables for notify-send
                     converted_filenames="";
                     converted_files_count=0;
                     videos_without_audio_streams="";
                     videos_without_audio_streams_count=0;

                     for pickedFilepath in $fx; do
                        case $pickedFilepath in
                  	*.mp4 | *.webm | *.mkv)
                  	  ;;
                  	*)
                  	   echo 'Skipping ''${pickedFilepath}' && continue 1;;
                        esac

                        parsed_MP3=$(echo "$pickedFilepath" | sed 's/\(.mp4\|.webm\|.mkv\)/.mp3/' | sed 's|.*\/||');
                        parsed_MP3="$HOME/Music/''${parsed_MP3}";

                        #Using ffprobe because videos without audiostream result in exit code 1 which stops this entire loop of many files
                        #Remove (alongside its 2 variables) if you don't record videos without audio (which are admittedly rare)
                        if [[ $(ffprobe -loglevel error -show_entries stream=codec_type -of csv=p=0 "$pickedFilepath") != *"audio"* ]]; then
                  	  ((videos_without_audio_streams_count=videos_without_audio_streams_count+1));
                  	  videos_without_audio_streams="$videos_without_audio_streams"$'\n'"$pickedFilepath";
                  	  continue 1;
                        fi

                        ffmpeg -i "$pickedFilepath" "$parsed_MP3";

                        ((converted_files_count=converted_files_count+1));
                        converted_filenames="$converted_filenames"$'\n'"$pickedFilepath";

                        if [[ $# -eq 1 ]]; then
                  	rm -f -- $pickedFilepath;
                        fi
                     done

                     #Notify the results to the user
                     if [[ $converted_files_count -gt 0 ]]; then
                        converted_filenames=$(echo "$converted_filenames" | sed 's|.*\/||');
                        notify-send "Converted MP3 Files($converted_files_count):" "$converted_filenames";
                     fi;

                     if [[ $videos_without_audio_streams_count -gt 0 ]]; then
                        videos_without_audio_streams=$(echo "$videos_without_audio_streams" | sed 's|.*\/||');
                        notify-send "Videos without audio stream($videos_without_audio_streams_count):" "$videos_without_audio_streams";
                     fi;

                     Uncomment the below line if you want to automatically unselect the original converted video files
                     lf -remote "send $id unselect";
                  }}'';
              convert_to_hevc = # bash
                ''
                  ''${{
                     clear;
                     set -f;

                     converted_filenames=""; #notify-send variable
                     converted_files_count=0; #notify-send variable

                     echo "Compression Rate? (default: 31, maximum: 50)";
                     read compressionRate;

                     #If not a number (e.g. empty), give default 31 value
                     if ! [[ $compressionRate =~ ^[0-5][0-9]$ ]]; then
                        compressionRate="31";
                     fi

                     for pickedFilepath in $fx; do
                        #could instead use ffprobe but would get more complicated as the filetype suffix becomes unknown
                        case $pickedFilepath in
                           *.mp4)
                  		tempFilepath=$(echo "$pickedFilepath" | sed 's|.mp4|(CONVERTING).mp4|');
                  		mv -f "$pickedFilepath" "$tempFilepath";

                  		ffmpeg -i "$tempFilepath" -vcodec libx265 -crf "$compressionRate" "$pickedFilepath";
                  		rm -f -- "$tempFilepath";
                  		;;
                           *.webm | *.mkv)
                  		newFilepath=$(echo "$pickedFilepath" | sed 's/\(.webm\|.mkv\)/.mp4/');
                  		ffmpeg -i "$pickedFilepath" -vcodec libx265 -crf "$compressionRate" "$newFilepath";
                  		rm -f -- "$pickedFilepath";
                  		;;
                  	 *)
                  	   continue 1;;
                        esac

                        ((converted_files_count=converted_files_count+1));
                        converted_filenames="$converted_filenames"$'\n'"$pickedFilepath";

                     done

                     #Notify the user of the results
                     if [[ $converted_files_count -gt 0 ]]; then
                        converted_filenames=$(echo "$converted_filenames" | sed 's|.*\/||');
                        notify-send "Compressed Videos($converted_files_count):" "$converted_filenames";
                     fi;
                  }}'';
              convert_html_to_markdown = # bash
                ''
                  ''${{
                    set -f;
                    pandoc -f html -t markdown -o temp.md $f
                  }}
                '';
              convert_to_images = # bash
                ''
                  ''${{
                    set -f;
                    printf "Extension name: "
                    read ext

                    for image in $fx; do
                        image_ext=$(echo $image | cut -d "." -f 2)
                        image_stem=$(echo $image | cut -d "." -f 1)
                        image_converted=''${image_stem}.$ext
                        if test $image_ext == $ext || test -e $image_converted; then
                            continue
                        fi
                        convert $image ''${image_stem}.$ext
                        rm $image
                    done
                  }}
                '';
              on-redraw = # bash
                ''
                  %{{
                      if [ $lf_width -le 80 ]; then
                          lf -remote "send $id set ratios 1:2"
                      elif [ $lf_width -le 160 ]; then
                          lf -remote "send $id set ratios 1:2:3"
                      else
                          lf -remote "send $id set ratios 1:2:3:5"
                      fi
                  }}'';
              move-parent = # bash
                ''
                  &{{
                      dironly="setlocal '$(dirname "$PWD")' dironly"
                      lf -remote "send $id :updir; $dironly true; $1; $dironly false; open"
                  }}'';
              link = # bash
                ''
                  %{{
                      set -- $(cat ~/.local/share/lf/files)
                      mode="$1"
                      shift
                      if [ "$#" -lt 1 ]; then
                          lf -remote "send $id echo no files to link"
                          exit 0
                      fi
                      case "$mode" in
                          # symbolically copy mode is indicating a soft link
                          copy) ln -sr -t . -- "$@";;
                          # while a move mode is indicating a hard link
                          move) ln -t . -- "$@";;
                      esac
                      rm ~/.local/share/lf/files
                      lf -remote "send clear"
                  }}'';
              move_to_folder = # bash
                ''
                  ''${{
                      set -f
                      printf "Directory name: "
                      read newd
                      mkdir -- "$newd"
                      mv -- $fx "$newd"
                  }}'';
              bulk_rename = # bash
                ''
                  ''${{
                      old="$(mktemp)"
                      new="$(mktemp)"
                      if [ -n "$fs" ]; then
                          fs="$(basename -a $fs)"
                      else
                          fs="$(ls)"
                      fi
                      printf '%s\n' "$fs" >"$old"
                      printf '%s\n' "$fs" >"$new"
                      $EDITOR "$new"
                      [ "$(wc -l < "$new")" -ne "$(wc -l < "$old")" ] && exit
                      paste "$old" "$new" | while IFS= read -r names; do
                          src="$(printf '%s' "$names" | cut -f1)"
                          dst="$(printf '%s' "$names" | cut -f2)"
                          if [ "$src" = "$dst" ] || [ -e "$dst" ]; then
                              continue
                          fi
                          mv -- "$src" "$dst"
                      done
                      rm -- "$old" "$new"
                      lf -remote "send $id unselect"
                  }}'';
              copy_to_clipboard = # bash
                ''
                  %{{
                      if type pbcopy > /dev/null 2>&1; then
                      printf '%s' "$f" | pbcopy
                      elif type xsel > /dev/null 2>&1; then
                      printf '%s' "$f" | xsel -ib
                      fi
                  }}'';
              yank_dirname = ''$dirname -- "$f" | head -c-1 | xclip -i -selection clipboard'';
              yank_path = ''$printf '%s' "$fx" | xclip -i -selection clipboard'';
              yank_basename = "$basename -a -- $fx | head -c-1 | xclip -i -selection clipboard";
              yank_basename_without_extension = "&basename -a -- $fx | cut -d. -f1 | head -c-1 | xclip -i -selection clipboard";
              open-with-gui = "&$@ $fx";
              open-with-cli = "$$@ $fx";
              share = ''$curl -F"file=@$fx" https://0x0.st | xclip -selection c'';
              toggle_preview = # bash
                ''
                  %{{
                      if [ "$lf_preview" = "true" ]; then
                          lf -remote "send $id :set preview false; set ratios 1:5"
                      else
                          lf -remote "send $id :set preview true; set ratios 1:2:3"
                      fi
                  }}'';
              select_files = # bash
                ''
                  &{{
                      get_files() {
                          if [ "$lf_hidden" = 'false' ]; then
                              find "$PWD" -mindepth 1 -maxdepth 1 -type f -not -name '.*' -print0
                          else
                              find "$PWD" -mindepth 1 -maxdepth 1 -type f -print0
                          fi |
                          xargs -0 printf ' %q'
                      }

                      lf -remote "send $id :unselect; toggle $(get_files)"
                  }}'';
              select_dirs = # bash
                ''
                  &{{
                      get_dirs() {
                          if [ "$lf_hidden" = 'false' ]; then
                              find "$PWD" -mindepth 1 -maxdepth 1 -type d -not -name '.*' -print0
                          else
                              find "$PWD" -mindepth 1 -maxdepth 1 -type d -print0
                          fi |
                          xargs -0 printf ' %q'
                      }

                      lf -remote "send $id :unselect; toggle $(get_dirs)"
                  }}'';
            };

            keybindings = {
              "<enter>" = "shell";
              "E" = "$vim $f";
              "`" = "!true";
              "x" = "$$f";
              "X" = "!$f";
              "a" = "push %ad<space>";
              "S" = "push :glob-select<space>";
              "v" = ":toggle; down";
              "V" = "invert";
              "<space>" = null;
              "<backspace2>" = ":setfilter";
              "<tab>" = ":toggle; down; toggle; down; toggle; down; toggle; down; toggle; down";
              "<backtab>" = ":up; toggle; up; toggle; up; toggle; up; toggle; up; toggle";
              "<delete>" = "delete";
              "<esc>" = ":clear; unselect;";
              "Z" = ":fzf_jump";
              "J" = "move-parent down";
              "K" = "move-parent up";
              "P" = ":link";
              "R" = "bulk_rename";
              "." = ":read; cmd-history-prev; cmd-enter";
              "O" = "push :open-with-gui<space>";
              "o" = "push :open-with-cli<space>";

              "Yd" = "yank_dirname";
              "Yp" = "yank_path";
              "Yb" = "yank_basename";
              "Ye" = "yank_basename_without_extension";

              "zp" = "toggle_preview";

              "gd" = "cd ~/Downloads";
              "gw" = "~/workspace";
              "g." = "cd ~/.config";
              "gr" = "go_to_git_root";

              "<c-f>" = ":filter; cmd-delete-home";
              "<c-c>" = ":copy_to_clipboard";

              "<space><space>" = "push :num_toggle<space>";

              "<space>x" = "extract";
              "<space>Xt" = "tar";
              "<space>Xz" = "zip";
              "<space>X7" = "7z";

              "<space>zt" = "linovel_txt";
              "<space>ze" = "linovel_epub";

              "<space>ca" = "convert_to_mp3";
              "<space>cv" = "convert_to_hevc";
              "<space>ci" = "convert_to_images";
              "<space>cm" = "convert_html_to_markdown";

              "<space>m" = "move_to_folder";

              "<space>sf" = "select_files";
              "<space>sd" = "select_dirs";

              "<space>S" = "share";
            };
          };
        }
        {
          fish = {
            shellAliases = {
              lf = "cd (command lf -print-last-dir $argv)";
            };
            functions = {
              lf-pick = ''
                function lf-pick --description 'lf file picker'
                    if ! type -q lf
                        echo "lf not installed"
                    end

                    set -l TEMP (mktemp)
                    lf -selection-path=$TEMP
                    echo >>"$TEMP"
                    while read -r line
                        echo "$line"
                    end <"$TEMP"
                end
              '';
            };
          };
        }
      ];
    }
  )
)
