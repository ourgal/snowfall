args:
args.module (
  args
  // {
    path = ./.;
    progs.mpv.config = {
      osd-bar-align-y = 0.92;
      sub-ass = "yes";
      sub-ass-line-spacing = 5;
      sub-scale = 1;
      sub-color = "#ffffffff";
      sub-shadow-color = "#ff000000";
      sub-back-color = "#aa000000";
      sub-border-color = "#ff0a0a0a";
      sub-border-size = 0.75;
      sub-shadow-offset = 2.5;
      sub-font-size = 64;
      sub-bold = "yes";
      sub-italic = "no";
      sub-margin-y = 30;
      sub-margin-x = 60;
      sub-ass-force-style = "PlayResX=1280,PlayResY=720,Name=Default,Fontname=Liberation Sans Narrow,Fontsize=32,PrimaryColour=&H00ffffff,BackColour=&H00000000,OutlineColour=&H00000000,Bold=1,Italic=0,Alignment=2,BorderStyle=3,Outline=0.3,Shadow=0,MarginL=60,MarginR=60,MarginV=30";
    };
  }
)
