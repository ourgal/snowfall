{
  path = ./.;
  nixPkgs = "wkhtmltopdf";
  myPkgs = "md2png";
  progs.fish.functions.md2png = {
    wraps = "md2png";
    body = ''
      command md2png -bin (which wkhtmltoimage) $argv
    '';
  };
}
