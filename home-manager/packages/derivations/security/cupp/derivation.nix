{
  lib,
  stdenv,
  makeWrapper,
  python3,
  fetchFromGitHub,
}:
stdenv.mkDerivation rec {
  pname = "cupp";
  version = "3.3.1";

  src = fetchFromGitHub {
    owner = "Mebus";
    repo = "cupp";
    rev = "v${version}";
    sha256 = "176bdb9f7iwirlglkirvyifc3j8ryyr4xdy90qgm253d846krlbq=";
  };

  nativeBuildInputs = [ makeWrapper ];
  buildInputs = [ python3 ];

  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/cupp
    cp cupp.py $out/share/cupp/cupp.py
    cp cupp.cfg $out/share/cupp/cupp.cfg
    chmod +x $out/share/cupp/cupp.py

    makeWrapper ${python3}/bin/python3 $out/bin/cupp \
      --add-flags "$out/share/cupp/cupp.py"

    runHook postInstall
  '';

  meta = with lib; {
    description = "Common User Passwords Profiler";
    license = licenses.gpl3Only;
    platforms = platforms.unix;
  };
}
