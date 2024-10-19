args:
args.module (
  args
  // (
    let
      inherit (args) config;
    in
    {
      path = ./.;
      nixPkgs = "perlnavigator";
      files = {
        ".cpan/CPAN/MyConfig.pm" = ''

          $CPAN::Config = {
            'allow_installing_module_downgrades' => q[ask/no],
            'allow_installing_outdated_dists' => q[ask/no],
            'applypatch' => q[],
            'auto_commit' => q[0],
            'build_cache' => q[100],
            'build_dir' => q[${config.home.homeDirectory}/.cpan/build],
            'build_dir_reuse' => q[0],
            'build_requires_install_policy' => q[yes],
            'bzip2' => q[/run/current-system/sw/bin/bzip2],
            'cache_metadata' => q[1],
            'check_sigs' => q[0],
            'cleanup_after_install' => q[0],
            'commandnumber_in_prompt' => q[1],
            'connect_to_internet_ok' => q[1],
            'cpan_home' => q[${config.home.homeDirectory}/.cpan],
            'ftp_passive' => q[1],
            'ftp_proxy' => q[],
            'getcwd' => q[cwd],
            'gpg' => q[${config.home.homeDirectory}/.nix-profile/bin/gpg],
            'gzip' => q[/run/current-system/sw/bin/gzip],
            'halt_on_failure' => q[0],
            'histfile' => q[${config.home.homeDirectory}/.cpan/histfile],
            'histsize' => q[100],
            'http_proxy' => q[],
            'inactivity_timeout' => q[0],
            'index_expire' => q[1],
            'inhibit_startup_message' => q[0],
            'keep_source_where' => q[${config.home.homeDirectory}/.cpan/sources],
            'load_module_verbosity' => q[none],
            'make' => q[${config.home.homeDirectory}/.nix-profile/bin/make],
            'make_arg' => q[],
            'make_install_arg' => q[],
            'make_install_make_command' => q[${config.home.homeDirectory}/.nix-profile/bin/make],
            'makepl_arg' => q[],
            'mbuild_arg' => q[],
            'mbuild_install_arg' => q[],
            'mbuild_install_build_command' => q[./Build],
            'mbuildpl_arg' => q[],
            'no_proxy' => q[],
            'pager' => q[moar],
            'patch' => q[/run/current-system/sw/bin/patch],
            'perl5lib_verbosity' => q[none],
            'plugin_list' => [],
            'prefer_external_tar' => q[1],
            'prefer_installer' => q[MB],
            'prefs_dir' => q[${config.home.homeDirectory}/.cpan/prefs],
            'prerequisites_policy' => q[follow],
            'pushy_https' => q[0],
            'recommends_policy' => q[1],
            'scan_cache' => q[atstart],
            'shell' => q[/run/current-system/sw/bin/fish],
            'show_unparsable_versions' => q[0],
            'show_upload_date' => q[0],
            'show_zero_versions' => q[0],
            'suggests_policy' => q[0],
            'tar' => q[/run/current-system/sw/bin/tar],
            'tar_verbosity' => q[none],
            'term_is_latin' => q[1],
            'term_ornaments' => q[1],
            'test_report' => q[0],
            'trust_test_report_history' => q[0],
            'unzip' => q[${config.home.homeDirectory}/.nix-profile/bin/unzip],
            'urllist' => [q[https://mirrors.cernet.edu.cn/CPAN/]],
            'use_prompt_default' => q[0],
            'use_sqlite' => q[0],
            'version_timeout' => q[15],
            'wget' => q[${config.home.homeDirectory}/.nix-profile/bin/wget],
            'yaml_load_code' => q[0],
            'yaml_module' => q[YAML],
          };
          1;
          __END__
        '';
      };
      enable = "global";
    }
  )
)
