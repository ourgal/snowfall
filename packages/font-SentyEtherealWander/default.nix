{ stdenvNoCC, p7zip, ... }:

stdenvNoCC.mkDerivation {
  pname = "font-SentyEtherealWander";
  version = "0.1.0";

  unpackCmd = ''
    7z x font.7z
  '';

  src = ./font.7z;

  nativeBuildInputs = [ p7zip ];

  installPhase = ''
    runHook preInstall
    install -Dm0644 *.ttf -t $out/share/fonts/truetype
    runHook postInstall
  '';

  meta = {
    description = "新蒂逍遥游，10000+简体字、繁体字、拉丁字母";
    homepage = "https://www.sentyfont.com/download.htm";
  };
}
