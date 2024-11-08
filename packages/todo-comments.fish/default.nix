{
  lib,
  _sources,
  fishPlugins,
}:
fishPlugins.buildFishPlugin {
  inherit (_sources."todo-comments.fish") pname version src;

  meta = with lib; {
    description = "List and search for TODO: like comments in the cwd";
    homepage = "https://github.com/kpbaks/todo-comments.fish";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "todo-comments-fish";
    platforms = platforms.all;
  };
}
