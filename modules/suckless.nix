{ pkgs, ... }:

{ 
  home.packages = with pkgs; [
    (pkgs.st.overrideAttrs (_: {
      src = ../config/st;
      patches = [ ];
    }))
    (pkgs.dmenu.overrideAttrs (_: {
      src = ../config/dmenu;

      buildInputs = with pkgs; [
         xorg.libX11
         xorg.libXft
         xorg.libXinerama
         freetype
         fontconfig
      ];

      buildPhase = ''
        make clean
        make CC=${pkgs.gcc}/bin/gcc \
             PREFIX=$out \
	     INCS="-I${pkgs.fontconfig.dev}/include \
	           -I${pkgs.freetype.dev}/include/freetype2 \
		   -I${pkgs.xorg.libX11.dev}/include \
		   -I${pkgs.xorg.xorgproto}/include \
		   -I${pkgs.xorg.libXinerama.dev}/include \
		   -I${pkgs.xorg.libXft.dev}/include"

             LIBS="-lX11 -lXft -lXinerama -lm -lfontconfig -lfreetype"
        '';
      patches = [ ];

    }))

    (pkgs.dwmblocks.overrideAttrs (_: {
      src = ../config/dwmblocks;
      patches = [ ];
    }))
    slock
  ];
}
