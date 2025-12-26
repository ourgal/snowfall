{ lib, ... }:
let
  giteeUsername = lib.strings.fileContents ./mygitee.key;
  bitbucketUsername = lib.strings.fileContents ./bitbucket.key;
in
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
      gitee = {
        name = "gitee";
        url = "git@gitee.com:";
      };
      myGitee = {
        name = "mygt";
        url = "git@gitee.com:${giteeUsername}/";
      };
      myBitbucket = {
        name = "mybb";
        url = "git@bitbucket.org:${bitbucketUsername}/";
      };
    };
    hostAliasesConfig = lib.attrsets.foldlAttrs (
      acc: _name: value:
      acc // { "url \"${value.url}\"".insteadOf = "${value.name}:"; }
    ) { } hostAliases;
  };
}
