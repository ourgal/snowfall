{ lib, ... }:
{
  git = rec {
    hostAliases = {
      myGithub = {
        name = "myg";
        url = "git@github.com:ourgal/";
      };
      github = {
        name = "gh";
        url = "git@github.com:";
      };
      soft = {
        name = "soft";
        url = "ssh://brix.local:23231/";
      };
    };
    hostAliasesConfig = lib.attrsets.foldlAttrs (
      acc: name: value:
      acc // { "url \"${value.url}\"".insteadOf = "${value.name}:"; }
    ) { } hostAliases;
  };
}
