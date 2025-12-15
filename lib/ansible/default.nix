{ lib, ... }:
let
  inherit (builtins)
    toJSON
    foldl'
    isString
    isAttrs
    throw
    ;
  _roles = {
    ansible_facts = {
      tasks =
        { }:
        toJSON [
          {
            name = "Ansible facts";
            "ansible.builtin.debug" = {
              var = "ansible_facts";
            };
          }
        ];
    };
    avahi = {
      tasks =
        { }:
        toJSON [
          {
            name = "Install avahi";
            "community.general.xbps" = {
              name = "{{ item }}";
            };
            loop = [
              "nss-mdns"
              "avahi"
            ];
            become = true;
            when = "ansible_facts.pkg_mgr == 'xbps'";
          }
          {
            name = "Enable avahi";
            "community.general.runit" = {
              name = "avahi-daemon";
              enabled = true;
              state = "started";
            };
            become = true;
          }
        ];
    };
    update_grub = {
      tasks =
        { }:
        toJSON [
          {
            name = "Install os-prober";
            "community.general.xbps" = {
              name = "os-prober";
            };
            become = true;
            when = "ansible_facts.pkg_mgr == 'xbps'";
          }
          {
            name = "Add os prober to grub config";
            "ansible.builtin.lineinfile" = {
              path = "/etc/default/grub";
              line = "GRUB_DISABLE_OS_PROBER=false";
            };
            become = true;
          }
          {
            name = "Update grub";
            "ansible.builtin.command" = {
              cmd = "update-grub";
            };
            become = true;
          }
        ];
    };
    add_sudo_group = {
      tasks =
        { }:
        toJSON [
          {
            name = "Add user to sudo group";
            "ansible.builtin.user" = {
              name = "{{ ansible_facts.env.USER }}";
              groups = [ "sudo" ];
              append = true;
            };
          }
        ];
    };
    chezmoi = {
      tasks =
        { }:
        toJSON [
          {
            name = "Chezmoi apply";
            "ansible.builtin.command" = {
              cmd = "chezmoi apply --force";
            };
          }
        ];
    };
    apt = {
      tasks =
        { }:
        toJSON [
          {
            name = "Add mirror";
            "ansible.builtin.replace" = {
              path = "/etc/apt/sources.list";
              regexp = "security.debian.org";
              replace = "mirrors.cernet.edu.cn";
            };
            become = true;
          }
          {
            name = "Install apt packages";
            "ansible.builtin.apt" = {
              name = "{{ item }}";
              update_cache = true;
            };
            loop = _packages.apt.present;
            become = true;
          }
        ];
    };
    xbps = {
      tasks =
        {
          packages ? _packages.xbps.present,
          upgrade ? true,
        }:
        toJSON (
          [
            {
              name = "Add mirror";
              "ansible.builtin.copy" = {
                dest = "/etc/xbps.d/00-repository-main.conf";
                content = ''
                  repository=https://mirror.nju.edu.cn/voidlinux/current
                '';
              };
              become = true;
            }
          ]
          ++ lib.optional upgrade {
            name = "Upgrade system";
            "community.general.xbps" = {
              upgrade = true;
            };
            become = true;
          }
          ++ [
            {
              name = "Install xbps packages";
              "community.general.xbps" = {
                name = "{{ item }}";
              };
              loop = packages;
              become = true;
            }
          ]
        );
    };
    oma = {
      tasks =
        { }:
        toJSON [
          {
            name = "Check if oma is installed";
            "ansible.builtin.stat" = {
              path = "/usr/bin/oma";
            };
            register = "oma_stat";
          }
          {
            name = "Main";
            block = [
              {
                name = "Install oma key";
                "ansible.builtin.shell" = {
                  cmd = "	curl -sSf https://repo.aosc.io/anthon/pubkeys/repo/oma.gpg | gpg --dearmor --yes -o /usr/share/keyrings/oma.gpg";
                };
                become = true;
              }
              {
                name = "Add oma repo";
                "ansible.builtin.apt_repository" = {
                  repo = "deb [signed-by=/usr/share/keyrings/oma.gpg] https://repo.aosc.io/anthon/oma trixie main";
                  filename = "oma";
                };
                become = true;
              }
              {
                name = "Add oma package";
                "ansible.builtin.apt" = {
                  name = "oma";
                  update_cache = true;
                };
                become = true;
              }
            ];
            when = [
              "ansible_facts.distribution == 'Debian' and ansible_facts.distribution_major_version | int >= 11 "
              "not oma_stat.stat.exists"
            ];
          }
        ];
    };
    homebrew = {
      tasks =
        { }:
        toJSON [
          {
            name = "Check if Homebrew is installed";
            "ansible.builtin.stat" = {
              path = "/home/linuxbrew/.linuxbrew/bin/brew";
            };
            register = "brew_stat";
          }
          {
            name = "Create Homebrew directory";
            "ansible.builtin.file" = {
              path = "/home/linuxbrew/.linuxbrew";
              state = "directory";
              owner = "{{ ansible_env.USER }}";
              group = "users";
              mode = "0755";
            };
            become = true;
          }
          {
            name = "Install homebrew";
            "ansible.builtin.command" = {
              cmd = ''git clone --depth=1 https://mirror.nju.edu.cn/git/homebrew/brew.git /home/linuxbrew/.linuxbrew'';
            };
            when = "not brew_stat.stat.exists";
          }
          {
            name = "Add homebrew shell to profile";
            "ansible.builtin.lineinfile" = {
              path = "/home/{{ ansible_env.USER }}/.profile";
              line = ''eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"'';
            };
          }
          {
            name = "Homebrew install packages";
            "community.general.homebrew" = {
              name = "{{ item }}";
            };
            loop = _packages.homebrew.present;
            environment = {
              HOMEBREW_BREW_GIT_REMOTE = "https://mirror.nju.edu.cn/git/homebrew/brew.git";
              HOMEBREW_CORE_GIT_REMOTE = "https://mirror.nju.edu.cn/git/homebrew/homebrew-core.git";
              HOMEBREW_INSTALL_FROM_API = 1;
            };
          }
        ];
    };
  };
  _packages = {
    apt = {
      present = [
        "fish"
        "git"
        "curl"
        "hx"
        "lazygit"
        "zoxide"
        "pipx"
        "rsync"
        "fzf"
        "lf"
        "ranger"
        "mpv"
      ];
    };
    xbps = {
      present = [
        "fish-shell"
        "git"
        "curl"
        "helix"
        "lazygit"
        "zoxide"
        "python3-pipx"
        "rsync"
        "fzf"
        "lf"
        "ranger"
        "chezmoi"
        "gitui"
        "mpv"
        "noto-fonts-cjk"
        "noto-fonts-emoji"
        "nerd-fonts"
        "htop"
        "btop"
        "mpv"
      ];
    };
    homebrew = {
      present = [
        "chezmoi"
        "gitui"
      ];
    };
  };
in
{
  ansible = {
    hosts = host: {
      all = {
        hosts = lib.attrsets.filterAttrs (n: _v: n == host) {
          surface-debian = {
            ansible_user = "zxc";
            ansible_host = "surface-debian.local";
            ansible_become_method = "su";
            ansible_become_pass = "{{ lookup('gopass', 'password/linux/root') }}";
          };
          surface-void = {
            ansible_user = "zxc";
            ansible_host = "surface-void.local";
            ansible_become_method = "sudo";
            ansible_become_pass = "{{ lookup('gopass', 'password/linux/user') }}";
          };
          void-live = {
            ansible_user = "anon";
            ansible_host = "192.168.123.181";
            ansible_become_method = "sudo";
            ansible_become_pass = "voidlinux";
          };
        };
      };
    };
    cfg = ''
      [defaults]
      inventory = inventory
      roles_path = roles
      nocows = True
      callback_result_format = yaml
      lookup_plugins = lookup_plugins
    '';
    add_roles_files =
      { roles, ansible_host }:
      foldl' (
        acc: v:
        acc
        // (
          if isString v then
            { "settings/ansible/${ansible_host}/roles/${v}/tasks/main.yaml" = _roles.${v}.tasks { }; }
          else if isAttrs v then
            {
              "settings/ansible/${ansible_host}/roles/${v.name}/tasks/main.yaml" = _roles.${v.name}.tasks v.args;
            }
          else
            throw "unsupported roles ${toString v}"
        )
      ) { } roles;
    role_names =
      roles:
      map (
        x:
        if isString x then
          x
        else if isAttrs x then
          x.name
        else
          throw "unsupported role type ${toString x}"
      ) roles;
    roles = _roles;
    packages = _packages;
  };
}
