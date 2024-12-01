args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      path = ./.;
      nixPkgs = "ssh-tpm-agent";
      value = {
        home.sessionVariablesExtra = ''
          if [[ -z "$SSH_AUTH_SOCK" ]]; then
            export SSH_AUTH_SOCK="$(ssh-tpm-agent --print-socket)"
          fi
        '';

        systemd.user.services.ssh-tpm-agent = {
          Install.Also = [ "ssh-agent.socket" ];

          Unit = {
            ConditionEnvironment = "!SSH_AGENT_PID";
            Description = "ssh-tpm-agent service";
            Documentation = "man:ssh-agent(1) man:ssh-add(1) man:ssh(1)";
            Requires = "ssh-tpm-agent.socket";
          };

          Service = {
            Environment = [
              "SSH_ASKPASS=${pkgs.x11_ssh_askpass}/libexec/x11-ssh-askpass"
              "SSH_AUTH_SOCK=%t/ssh-tpm-agent.sock"
            ];
            ExecStart = "${pkgs.ssh-tpm-agent}/bin/ssh-tpm-agent";
            PassEnvironment = "SSH_AGENT_PID";
            SuccessExitStatus = 2;
            Type = "simple";
          };
        };

        systemd.user.sockets.ssh-tpm-agent = {
          Install.WantedBy = [ "sockets.target" ];

          Unit = {
            Description = "SSH TPM agent socket";
            Documentation = "man:ssh-agent(1) man:ssh-add(1) man:ssh(1)";
          };

          Socket = {
            ListenStream = "%t/ssh-tpm-agent.sock";
            SocketMode = "0600";
            Service = "ssh-tpm-agent.service";
          };
        };
      };
    }
  )
)
