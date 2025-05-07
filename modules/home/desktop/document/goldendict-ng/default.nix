args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      nixPkgs = "goldendict-ng";
      confs = {
        "goldendict/dicts/ecdict" = pkgs.fetchzip {
          url = "https://github.com/skywind3000/ECDICT/releases/download/1.0.28/ecdict-mdx-style-28.zip";
          hash = "sha256-kyzEPMTrvEqeYmtZsaYl44S90SwOxE//yqHBj23YSNM=";
          stripRoot = false;
        };
        "goldendict/dicts/gpt4/dict.mdx" = pkgs.fetchurl {
          name = "DictionaryByGPT4";
          url = "https://github.com/Ceelog/DictionaryByGPT4/raw/refs/heads/main/%E5%A8%81%E5%A8%81%E7%9A%84GPT%E5%8D%95%E8%AF%8D%E6%9C%AC(8000%E8%AF%8D).mdx";
          hash = "sha256-705VBBTJkQU6iVLfsghcSBvSls4JldwT2JlKbsAyPc8=";
        };
      };
    }
  )
)
