{ ... }:
_final: prev: {
  pipx = prev.jackett.overrideAttrs {
    disabledTests = [
      "test_fix_package_name"
      "test_parse_specifier_for_metadata"
    ];
  };
}
