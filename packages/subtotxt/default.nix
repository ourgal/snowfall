{
  lib,
  python3Packages,
  _sources',
}:
python3Packages.buildPythonApplication {
  inherit (_sources' ./.) pname version src;
  format = "other";

  propagatedBuildInputs = with python3Packages; [
    send2trash
    charset-normalizer
    setuptools
  ];

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    sed -i "1i #!/usr/bin/env python" subtotxt.py
    install -m755 -D subtotxt.py $out/bin/subtotxt
    runHook postInstall
  '';

  meta = {
    description = "Quickly convert an .srt or .vtt to plain text, removes timestamps and .srt subtitle line numbers";
    homepage = "https://github.com/NebularNerd/subtotxt";
    license = lib.licenses.cc0;
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "subtotxt";
    platforms = lib.platforms.all;
  };
}
