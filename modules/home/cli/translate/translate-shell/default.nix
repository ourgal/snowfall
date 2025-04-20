{
  path = ./.;
  progs = [
    "translate-shell"
    { fish.functions.fy.body = "trans -p en:zh $argv"; }
  ];
}
