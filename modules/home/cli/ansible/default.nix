args:
args.module (
  args
  // (
    let
      inherit (args) lib namespace config;
      inherit (lib.${namespace}) settings;
      inherit (builtins) foldl';
    in
    {
      enable = [
        "surface-debian"
        "surface-void"
        "void-live"
      ];
      confs = {
        "settings/ansible/surface-void.json" = {
          xbps = [
            { upgrade = true; }
            {
              name =
                let
                  mdns = [
                    "nss-mdns"
                    "avahi"
                  ];
                  multi_os = [ "os-prober" ];
                  fonts = [
                    "noto-fonts-cjk"
                    "noto-fonts-emoji"
                    "nerd-fonts"
                  ];
                  stats = [
                    "htop"
                    "btop"
                  ];
                  video = [ "mpv" ];
                  download = [
                    "aria2"
                    "curl"
                  ];
                in
                download ++ mdns ++ video ++ stats ++ fonts ++ multi_os;
            }
          ];
          runit = [
            {
              name = "avahi-daemon";
              enabled = true;
            }
          ];
          command = [
            {
              cmd = "update-grub";
              become = true;
            }
            {
              cmd = "xbps-remove -Ooy";
              become = true;
            }
          ];
          lineinfile = [
            {
              path = "/etc/default/grub";
              line = "GRUB_DISABLE_OS_PROBER=false";
              become = true;
            }
          ];
          file = [
            {
              path = "/etc/xbps.d";
              state = "directory";
              mode = "644";
              owner = "root";
              group = "root";
              become = true;
            }
          ];
          copy =
            let
              change_hostname =
                let
                  hostname = "surface-void";
                in
                [
                  {
                    dest = "/etc/hostname";
                    content = hostname;
                    become = true;
                  }
                  {
                    dest = "/etc/hosts";
                    content = ''
                      127.0.0.1       ${hostname} localhost.localdomain localhost
                      ::1             localhost localhost.localdomain ip6-localhost
                    '';
                    become = true;
                  }
                ];
              mirror = [
                {
                  dest = "/etc/xbps.d/00-repository-main.conf";
                  content = "repository=https://mirror.nju.edu.cn/voidlinux/current";
                  become = true;
                }
              ];
            in
            change_hostname ++ mirror;
        };
        "settings/ansible/surface-debian.json" = {
          apt = [
            { upgrade = "safe"; }
            {
              name = [
                "fish"
                "yt-dlp"
                "python3-mutagen"
                "ffmpeg"
                "make"
              ];
              update_cache = true;
            }
          ];
          file = [
            {
              path = "/home/zxc/Music/net";
              state = "directory";
            }
          ];
          copy = [
            {
              dest = "/home/zxc/Music/net/Makefile";
              content = config.home.file."Music/net/Makefile".text;
            }
          ];
          replace = [
            {
              path = "/etc/apt/sources.list";
              regexp = "security.debian.org";
              replace = "mirrors.cernet.edu.cn";
              become = true;
            }
          ];
        };
        "settings/ansible/chromebit.json" =
          let
            hostname = "chromebit";
          in
          {
            user = [
              {
                name = "root";
                password = settings.rootPassword;
              }
              {
                name = "user";
                password = settings.userPassword;
              }
            ];
            apk = [
              { upgrade = true; }
              {
                name =
                  let
                    browser = [
                      "chromium"
                      "firefox"
                    ];
                    shell = [
                      "fish"
                      "zsh"
                      "bash"
                    ];
                    stats = [
                      "htop"
                      "btop"
                    ];
                    font = [
                      "font-fira-code-nerd"
                      "font-noto-cjk"
                    ];
                    player = [ "mpv" ];
                    dev = [ "git" ];
                    web = [ "curl" ];
                    dotfiles = [ "chezmoi" ];
                    system = [ "doas-sudo-shim" ];
                  in
                  dotfiles ++ browser ++ shell ++ stats ++ font ++ player ++ dev ++ web ++ system;
              }
              {
                name = [
                  "sudo"
                  "ruby"
                ];
                state = "absent";
              }
            ];
            file = [
              {
                path = "/etc/sway/config.d/00-logo-key.conf";
                state = "absent";
              }
            ];
            replace = [
              {
                path = "/etc/apk/repositories";
                regexp = "dl-cdn.alpinelinux.org";
                replace = "mirrors.aliyun.com";
              }
            ];
            command =
              let
                autostart_services = [
                  {
                    name = "sshd";
                    runlevel = "default";
                  }
                  {
                    name = "ntpd";
                    runlevel = "default";
                  }
                ];
              in
              foldl' (
                acc: v:
                acc
                ++ [
                  {
                    cmd = "rc-update add ${v.name} ${v.runlevel}";
                    become = true;
                  }
                ]
              ) [ ] autostart_services;
            shell =
              let
                disabled_services = [
                  {
                    name = "chronyd";
                    runlevel = "default";
                  }
                ];
              in
              foldl' (
                acc: v: acc ++ [ "grep -q ${v.name} <(rc-update) && rc-update del ${v.name} ${v.runlevel} || true" ]
              ) [ ] disabled_services;
            copy =
              let
                change_hostname = [
                  {
                    dest = "/etc/hostname";
                    content = hostname;
                    become = true;
                  }
                  {
                    dest = "/etc/hosts";
                    content = ''
                      127.0.0.1       ${hostname} localhost.localdomain localhost
                      ::1             localhost localhost.localdomain
                    '';
                    become = true;
                  }
                ];
              in
              change_hostname;
            homebrew = [
              { name = [ "qman" ]; }
              { upgrade = true; }
            ];
          };
      };
    }
  )
)
