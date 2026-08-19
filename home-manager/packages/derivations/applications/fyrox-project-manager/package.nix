{ pkgs, lib, ... }: {
  home.packages = [
    (pkgs.rustPlatform.buildRustPackage rec {
      pname = "fyrox-project-manager";
      version = "1.0.1";

      src = pkgs.fetchCrate {
        inherit pname version;

        hash = "sha256-GzABSZ5JA4l7fAdS264VPJmRnz8scg5P7j7QKv7Fc7M=";
      };

      cargoHash = "sha256-tkNWUakZ2MbjUTwlVm59o7bZc7fCVh4h3GF+zTfRzNo=";

      nativeBuildInputs = with pkgs; [
        pkg-config
        makeWrapper
      ];

      buildInputs = with pkgs; [
        libx11
        libxcb
        alsa-lib
        wayland
        libxkbcommon
        libGL
        rustc
      ];

      postInstall = ''
        wrapProgram $out/bin/fyrox-project-manager \
          --prefix LD_LIBRARY_PATH : ${lib.makeLibraryPath buildInputs}
      '';

      meta = {
        description = "Project Manager for the Fyrox Game Engine";
        homepage = "https://fyrox.rs/";
        license = lib.licenses.mit;
        mainProgram = "fyrox-project-manager";
      };
    })
  ];
}
