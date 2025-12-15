args:
args.module (
  args
  // (
    let
      inherit (args)
        lib
        namespace
        pkgs
        _name
        ;
      inherit (lib.${namespace}) ansible getDirname;
      inherit (builtins) toJSON;
      ansible_host = getDirname _name;
      roles = [
        "ansible_facts"
        {
          name = "xbps";
          args = {
            packages = [ "parted" ];
            upgrade = false;
          };
        }
      ];
    in
    {
      confs = {
        "settings/ansible/${ansible_host}/playbooks/main.yaml" = toJSON [
          {
            name = "Void live cd playbook";
            hosts = ansible_host;
            roles = ansible.role_names roles;
          }
        ];
        "settings/ansible/${ansible_host}/inventory/hosts.yaml" = ansible.hosts ansible_host;
        "settings/ansible/${ansible_host}/lookup_plugins/gopass.py" =
          pkgs.${namespace}.ansible-lookup-plugin-gopass;
        "settings/ansible/${ansible_host}/ansible.cfg" = ansible.cfg;
        "settings/ansible/${ansible_host}/Makefile" = ''
          all:
          	ansible-playbook playbooks/main.yaml
        '';
      }
      // ansible.add_roles_files { inherit roles ansible_host; };
    }
  )
)
