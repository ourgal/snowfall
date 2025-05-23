args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule enabled;
  inherit (config.${namespace}.user) host;
  value = {
    services.kmonad = enabled // {
      keyboards.miryoku = {
        device =
          if (host == "surface") then
            "/dev/input/by-id/usb-Microsoft_Surface_Type_Cover-event-kbd"
          else if (host == "air") then
            "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
          else
            "/dev/input/by-id/usb-CATEX_TECH._75EC-XRGB_CA2015010002-event-kbd"; # niz
        defcfg = enabled;
        config = ''
          (defsrc
          2 3 4 5 6 8 9 0 - =
          q w e r t i o p [ ]
          caps a s d f k l ; ' ent
                        x c v , . /
          )
          (deflayer U_BASE
          q	w	f	p	b	j	l	u	y	'
          (tap-hold-next-release 200 a met)	(tap-hold-next-release 200 r alt)	(tap-hold-next-release 200 s ctl)	(tap-hold-next-release 200 t sft)	g	m	(tap-hold-next-release 200 n sft)	(tap-hold-next-release 200 e ctl)	(tap-hold-next-release 200 i alt)	(tap-hold-next-release 200 o met)
          (tap-hold-next-release 200 z (layer-toggle U_BUTTON))	(tap-hold-next-release 200 x ralt)	c	d	v	k	h	,	(tap-hold-next-release 200 . ralt)	(tap-hold-next-release 200 / (layer-toggle U_BUTTON))
                (tap-hold-next-release 200 esc (layer-toggle U_MEDIA))	(tap-hold-next-release 200 spc (layer-toggle U_NAV))	(tap-hold-next-release 200 tab (layer-toggle U_MOUSE))	(tap-hold-next-release 200 ent (layer-toggle U_SYM))	(tap-hold-next-release 200 bspc (layer-toggle U_NUM))	(tap-hold-next-release 200 del (layer-toggle U_FUN))
          )
          (deflayer U_EXTRA
          q	w	e	r	t	y	u	i	o	p
          (tap-hold-next-release 200 a met)	(tap-hold-next-release 200 s alt)	(tap-hold-next-release 200 d ctl)	(tap-hold-next-release 200 f sft)	g	h	(tap-hold-next-release 200 j sft)	(tap-hold-next-release 200 k ctl)	(tap-hold-next-release 200 l alt)	(tap-hold-next-release 200 ' met)
          (tap-hold-next-release 200 z (layer-toggle U_BUTTON))	(tap-hold-next-release 200 x ralt)	c	v	b	n	m	,	(tap-hold-next-release 200 . ralt)	(tap-hold-next-release 200 / (layer-toggle U_BUTTON))
                (tap-hold-next-release 200 esc (layer-toggle U_MEDIA))	(tap-hold-next-release 200 spc (layer-toggle U_NAV))	(tap-hold-next-release 200 tab (layer-toggle U_MOUSE))	(tap-hold-next-release 200 ent (layer-toggle U_SYM))	(tap-hold-next-release 200 bspc (layer-toggle U_NUM))	(tap-hold-next-release 200 del (layer-toggle U_FUN))
          )
          (deflayer U_TAP
          q	w	f	p	b	j	l	u	y	'
          a	r	s	t	g	m	n	e	i	o
          z	x	c	d	v	k	h	,	.	/
                esc	spc	tab	ent	bspc	del
          )
          (deflayer U_BUTTON
          undo	S-del	C-ins	S-ins	again	again	S-ins	C-ins	S-del	undo
          met	alt	ctl	sft	XX	XX	sft	ctl	alt	met
          undo	S-del	C-ins	S-ins	again	again	S-ins	C-ins	S-del	undo
                #(kp* kp5)	#(kp/ kp5)	#(kp- kp5)	#(kp- kp5)	#(kp/ kp5)	#(kp* kp5)
          )
          (deflayer U_NAV
          XX	(layer-switch U_TAP)	(layer-switch U_EXTRA)	(layer-switch U_BASE)	XX	again	S-ins	C-ins	S-del	undo
          met	alt	ctl	sft	XX	caps	left	down	up	right
          XX	ralt	(layer-switch U_NUM)	(layer-switch U_NAV)	XX	ins	home	pgdn	pgup	end
                XX	XX	XX	ent	bspc	del
          )
          (deflayer U_MOUSE
          XX	(layer-switch U_TAP)	(layer-switch U_EXTRA)	(layer-switch U_BASE)	XX	again	S-ins	C-ins	S-del	undo
          met	alt	ctl	sft	XX	XX	kp4	kp2	kp8	kp6
          XX	ralt	(layer-switch U_SYM)	(layer-switch U_MOUSE)	XX	XX	XX	XX	XX	XX
                XX	XX	XX	#(kp- kp5)	#(kp/ kp5)	#(kp* kp5)
          )
          (deflayer U_MEDIA
          XX	(layer-switch U_TAP)	(layer-switch U_EXTRA)	(layer-switch U_BASE)	XX	XX	XX	XX	XX	XX
          met	alt	ctl	sft	XX	XX	previoussong	vold	volu	nextsong
          XX	ralt	(layer-switch U_FUN)	(layer-switch U_MEDIA)	XX	XX	XX	XX	XX	XX
                XX	XX	XX	stopcd	playpause	mute
          )
          (deflayer U_NUM
          [	7	8	9	]	XX	(layer-switch U_BASE)	(layer-switch U_EXTRA)	(layer-switch U_TAP)	XX
          ;	4	5	6	=	XX	sft	ctl	alt	met
          `	1	2	3	\\	XX	(layer-switch U_NUM)	(layer-switch U_NAV)	ralt	XX
                .	0	-	XX	XX	XX
          )
          (deflayer U_SYM
          {	&	*	\(	}	XX	(layer-switch U_BASE)	(layer-switch U_EXTRA)	(layer-switch U_TAP)	XX
          :	$	%	^	+	XX	sft	ctl	alt	met
          ~	!	@	#	|	XX	(layer-switch U_SYM)	(layer-switch U_MOUSE)	ralt	XX
                \(	\)	\_	XX	XX	XX
          )
          (deflayer U_FUN
          f12	f7	f8	f9	sysrq	XX	(layer-switch U_BASE)	(layer-switch U_EXTRA)	(layer-switch U_TAP)	XX
          f11	f4	f5	f6	slck	XX	sft	ctl	alt	met
          f10	f1	f2	f3	pause	XX	(layer-switch U_FUN)	(layer-switch U_MEDIA)	ralt	XX
                comp	spc	tab	XX	XX	XX
          )
        '';
      };
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
