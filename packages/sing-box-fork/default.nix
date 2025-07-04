{
  lib,
  stdenv,
  buildGoModule,
  installShellFiles,
  buildPackages,
  coreutils,
  nix-update-script,
  nixosTests,
  _sources',
  namespace,
}:
let
  source = _sources' ./.;
in
buildGoModule (
  lib.${namespace}.mkGoSource source
  // {
    vendorHash = "sha256-ZWFZkVRtybQAK9oZRIMBGeDfxXTV7kzXwNSbkvslMFk=";

    tags = [
      "with_quic"
      "with_dhcp"
      "with_wireguard"
      "with_ech"
      "with_utls"
      "with_reality_server"
      "with_acme"
      "with_clash_api"
      "with_gvisor"
    ];

    subPackages = [ "cmd/sing-box" ];

    nativeBuildInputs = [ installShellFiles ];

    ldflags = [ "-X=github.com/sagernet/sing-box/constant.Version=${source.version}" ];

    postInstall =
      let
        emulator = stdenv.hostPlatform.emulator buildPackages;
      in
      ''
        installShellCompletion --cmd sing-box \
          --bash <(${emulator} $out/bin/sing-box completion bash) \
          --fish <(${emulator} $out/bin/sing-box completion fish) \
          --zsh  <(${emulator} $out/bin/sing-box completion zsh )

        substituteInPlace release/config/sing-box{,@}.service \
          --replace-fail "/usr/bin/sing-box" "$out/bin/sing-box" \
          --replace-fail "/bin/kill" "${coreutils}/bin/kill"
        install -Dm444 -t "$out/lib/systemd/system/" release/config/sing-box{,@}.service
      '';

    passthru = {
      updateScript = nix-update-script { };
      tests = { inherit (nixosTests) sing-box; };
    };

    meta = with lib; {
      homepage = "https://sing-box.sagernet.org";
      description = "Universal proxy platform";
      license = licenses.gpl3Plus;
      maintainers = with maintainers; [ nickcao ];
      mainProgram = "sing-box";
    };
  }
)
