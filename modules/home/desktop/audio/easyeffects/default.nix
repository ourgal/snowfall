args:
args.module (
  args
  // {
    path = ./.;
    servs.easyeffects.preset = "LoudnessEqualizer";
    confs."easyeffects/output" = [
      ./LoudnessEqualizer.json
      ./Bose.json
      ./Music.json
      ./Sony.json
      ./Video.json
      ./Perfect_EQ.json
      ./Bass_Enhancing_+_Perfect_EQ.json
    ];
  }
)
