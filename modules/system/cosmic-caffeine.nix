{ pkgs, lib, ... }:

let
  cosmic-caffeine = pkgs.rustPlatform.buildRustPackage rec {
    pname = "cosmic-caffeine";
    version = "1.2.0";

    src = pkgs.fetchFromGitHub {
      owner = "Oussamaberchi";
      repo = "caffeine-cosmic";
      rev = "main";
      hash = "sha256-iql8PZnpoD3X8T0QsChgw892+Nn91LG66h6Up1+9Xtg=";
    };

    # NOTE: Since this project has many Git dependencies, we use useFetchCargoVendor.
    # The user will need to update this hash after the first failed build attempt.
    useFetchCargoVendor = true;
    cargoHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

    nativeBuildInputs = [
      pkgs.pkg-config
    ];

    buildInputs = [
      pkgs.libxkbcommon
      pkgs.wayland
      pkgs.xorg.libX11
      pkgs.libGL
    ];

    postInstall = ''
      install -Dm644 assets/com.github.cosmic-caffeine.desktop -t $out/share/applications
      install -Dm644 assets/oussama-berchi-caffeine-cosmic.svg -t $out/share/icons/hicolor/scalable/apps
    '';

    meta = with lib; {
      description = "Caffeine for COSMIC - Prevent screen sleep and display timeout";
      homepage = "https://github.com/Oussamaberchi/caffeine-cosmic";
      license = licenses.mit;
      mainProgram = "cosmic-caffeine";
      platforms = platforms.linux;
    };
  };
in
{
  environment.systemPackages = [ cosmic-caffeine ];
}
