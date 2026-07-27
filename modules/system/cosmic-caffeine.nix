{ pkgs, lib, ... }:

let
  cosmic-caffeine = pkgs.rustPlatform.buildRustPackage rec {
    pname = "cosmic-caffeine";
    version = "1.2.0";

    src = pkgs.fetchFromGitHub {
      owner = "Oussamaberchi";
      repo = "caffeine-cosmic";
      rev = "main";
      hash = "sha256-WlPhPOuF8CfQ+MuBwuCuQUR+BAQP4pUT5qPucxx4Oz0=";
    };

    # The real hash obtained from the first build attempt.
    cargoHash = "sha256-L+p14hkcA7WH1Vgml9S3N7RTvs6m7yA9D0gOrkTIrTY=";

    # Fix version mismatches and API changes
    # The upstream repository has been updated recently.
    postPatch = ''
      substituteInPlace Cargo.toml \
        --replace-fail 'dirs = "5"' 'dirs = "6"' \
        --replace-fail 'toml = "0.8"' 'toml = "0.5"'
    '';

    nativeBuildInputs = [
      pkgs.pkg-config
    ];

    buildInputs = [
      pkgs.libxkbcommon
      pkgs.wayland
      pkgs.libx11
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
