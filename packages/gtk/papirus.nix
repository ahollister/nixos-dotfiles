{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "papirus";

  src = pkgs.fetchurl {
    url = "https://github.com/PapirusDevelopmentTeam/papirus-icon-theme/archive/refs/tags/20240501.zip";
    sha256 = "09hi17r0r40ivbvg97nps2xx78alf1rxzb0iq5pfb8h3sn8dx03b";
  };

  dontUnpack = true;

  installPhase = ''
    	mkdir -p $out
    	${pkgs.unzip}/bin/unzip $src -d $out/
  '';
}
