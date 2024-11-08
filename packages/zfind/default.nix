{
  lib,
  buildGoModule,
  _sources,
}:
buildGoModule rec {
  inherit (_sources.zfind) pname version src;

  vendorHash = "sha256-blq0/pRppdf2jcuhIqYeNhcazFNZOGeEjPTSLgHqhrU=";

  ldflags = [
    "-X"
    "main.appVersion=${version}"
  ];

  postInstall = "rm $out/bin/scripts";

  meta = with lib; {
    description = "CLI for file search with SQL like syntax.";
    longDescription = ''
      zfind allows you to search for files, including inside tar, zip, 7z and rar archives.
      It makes finding files easy with a filter syntax that is similar to an SQL-WHERE clause.
    '';
    homepage = "https://github.com/laktak/zfind";
    changelog = "https://github.com/laktak/zfind/releases/tag/v${version}";
    license = licenses.mit;
    mainProgram = "zfind";
    maintainers = with maintainers; [ eeedean ];
  };
}
