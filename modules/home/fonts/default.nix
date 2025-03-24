args:
args.module (
  args
  // (
    let
      inherit (args) lib namespace;
      inherit (lib.${namespace}) font;
    in
    {
      path = ./.;
      nixPkgs = font.defaults;
      confs."fontconfig/fonts.conf" =
        let
          item = list: builtins.concatStringsSep "\n" (builtins.map (x: "<string>${x}</string>") list);
          emoji = item font.emoji;
          cnSans = item [ font.cnSans ];
          cnSerif = item [ font.cnSerif ];
          enSans = item [ font.enSans ];
          enSerif = item [ font.enSerif ];
          mono = item [ font.mono ];
        in
        ''
          <?xml version="1.0"?>
          <!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">

          <fontconfig>

          <!-- Default system-ui fonts -->
          <match target="pattern">
            <test name="family">
              <string>system-ui</string>
            </test>
            <edit name="family" mode="prepend" binding="strong">
              <string>sans-serif</string>
            </edit>
          </match>

          <!-- Default sans-serif fonts-->
          <match target="pattern">
            <test name="family">
              <string>sans-serif</string>
            </test>
            <edit name="family" mode="prepend" binding="strong">
              ${cnSans}
              ${enSans}
              ${emoji}
            </edit>
          </match>

          <!-- Default serif fonts-->
          <match target="pattern">
            <test name="family">
              <string>serif</string>
            </test>
            <edit name="family" mode="prepend" binding="strong">
              ${cnSerif}
              ${enSerif}
              ${emoji}
            </edit>
          </match>

          <!-- Default monospace fonts-->
          <match target="pattern">
            <test name="family">
              <string>monospace</string>
            </test>
            <edit name="family" mode="prepend" binding="strong">
              ${mono}
              ${cnSans}
              ${emoji}
            </edit>
          </match>

          <match target="pattern">
            <test name="lang">
              <string>zh-HK</string>
            </test>
            <test name="family">
              ${cnSans}
            </test>
            <edit name="family" binding="strong">
              <string>Source Han Sans HC</string>
            </edit>
          </match>

          <match target="pattern">
            <test name="lang">
              <string>zh-TW</string>
            </test>
            <test name="family">
              ${cnSans}
            </test>
            <edit name="family" binding="strong">
              <string>Source Han Sans TC</string>
            </edit>
          </match>

          <match target="pattern">
            <test name="lang">
              <string>ja</string>
            </test>
            <test name="family">
              ${cnSans}
            </test>
            <edit name="family" binding="strong">
              <string>Source Han Sans HW</string>
            </edit>
          </match>

          <match target="pattern">
            <test name="lang">
              <string>ko</string>
            </test>
            <test name="family">
              ${cnSans}
            </test>
            <edit name="family" binding="strong">
              <string>Source Han Sans K</string>
            </edit>
          </match>

          <match target="pattern">
            <test name="lang" compare="contains">
              <string>en</string>
            </test>
            <test name="family" compare="contains">
              <string>Source Han</string>
            </test>
            <edit name="family" mode="prepend" binding="strong">
              ${enSans}
            </edit>
          </match>

          </fontconfig>
        '';
    }
  )
)
