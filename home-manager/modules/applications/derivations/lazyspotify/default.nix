{
  lib,
  buildGoModule,
  pkg-config,
  alsa-lib,
  dbus,
  libpulseaudio,
  xclip,
  wl-clipboard,
  xsel,
  makeWrapper,
  src,
}:
buildGoModule {
  pname = "lazyspotify";
  version = "main";

  inherit src;

  vendorHash = "sha256-Axdt3/3ZOZY9Z5VUI6Wh77oIREOO26ODMyEgtscTmn8=";

  nativeBuildInputs = [
    pkg-config
    makeWrapper
  ];

  buildInputs = [
    alsa-lib
    dbus
    libpulseaudio
  ];

  propagatedBuildInputs = [
    xclip
    wl-clipboard
    xsel
  ];

  buildPhase = ''
    runHook preBuild

    make build

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin

    cp target/lazyspotify $out/bin/lazyspotify

    runHook postInstall
  '';

  postFixup = ''
    wrapProgram $out/bin/lazyspotify \
      --prefix PATH : ${
        lib.makeBinPath [
          xclip
          wl-clipboard
          xsel
        ]
      }
  '';

  meta = with lib; {
    description = "terminal-based spotify client";
    homepage = "https://github.com/dubeyKartikay/lazyspotify";
    license = licenses.mit;
    platforms = platforms.linux;
    mainProgram = "lazyspotify";
  };
}
