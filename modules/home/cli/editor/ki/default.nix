{
  myPkgs = "ki-editor";
  progs.fish.functions.ki = {
    body = ''
      set cmds grammar highlight-query edit log in help
      if test -z $argv[1]
        command ki
      end
      if contains $argv[1] $cmds
        command ki $argv
      else
        command ki edit $argv
      end
    '';
    description = "ki editor";
  };
}
