{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    value =
      let
        display1 = {
          name = "DVI-D-0";
          fp = "00ffffffffffff001e6d1f5aa2c106000919010380331d78ea6275a3554fa027125054a76b80714f81c08100818095009040a9c0b300023a801871382d40582c4500fe221100001e000000fd00384b1e530f000a202020202020000000fc0032344d5035350a202020202020000000ff003530394e54595444303738360a0002";
        };
        display2 = {
          name = "HDMI-0";
          fp = "00ffffffffffff0005e301244c2b0000161d010380351e782a0561a756529c270f5054bfef00d1c0b30095008180814081c001010101023a801871382d40582c45000f282100001e2a4480a070382740302035000f282100001a000000fc0032344e31573147350a20202020000000fd00304c1e5512000a2020202020200128020329f14b101f051404130312021101230907078301000067030c001000003c681a00000101304c008c0ad08a20e02d10103e96000f2821000018011d007251d01e206e2855000f282100001e8c0ad08a20e02d10103e96000f28210000188c0ad090204031200c4055000f2821000018000000000000000000000000000084";
        };
      in
      {
        programs.autorandr = {
          enable = true;
          profiles = {
            both = {
              config = {
                "${display1.name}" = {
                  enable = true;
                  mode = "1920x1080";
                  primary = true;
                  position = "0x0";
                  rate = "60.00";
                  crtc = 1;
                };
                "${display2.name}" = {
                  enable = true;
                  mode = "1920x1080";
                  position = "1920x0";
                  rate = "60.00";
                  crtc = 0;
                };
              };
              fingerprint = {
                "${display1.name}" = "${display1.fp}";
                "${display2.name}" = "${display2.fp}";
              };
            };
            external = {
              config = {
                "${display2.name}" = {
                  enable = true;
                  mode = "1920x1080";
                  position = "0x0";
                  primary = true;
                  rate = "60.00";
                  crtc = 0;
                };
              };
              fingerprint = {
                "${display1.name}" = "${display1.fp}";
                "${display2.name}" = "${display2.fp}";
              };
            };
            primary = {
              config = {
                "${display1.name}" = {
                  enable = true;
                  mode = "1920x1080";
                  position = "0x0";
                  primary = true;
                  rate = "60.00";
                  crtc = 0;
                };
              };
              fingerprint = {
                "${display1.name}" = "${display1.fp}";
              };
            };
          };
        };
      };
  }
)
