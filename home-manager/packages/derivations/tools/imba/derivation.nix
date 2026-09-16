{
  pkgs,
  lib,
  ...
}:
let
  imba-src = pkgs.fetchurl {
    url = "https://registry.npmjs.org/imba/-/imba-2.0.0-alpha.253.tgz";
    hash = "sha256-X8+11NKjWprzmMNIzKhDhl+sTxEZXVk72upr75iAQqs=";
  };

  imba-lock = pkgs.stdenv.mkDerivation {
    name = "imba-package-lock.json";
    src = imba-src;

    nativeBuildInputs = with pkgs; [
      nodejs_22
      cacert # certs
    ];

    buildPhase = ''
      # requires a temporary directory
      export HOME=$(mktemp -d)

      npm install --package-lock-only --verbose
    '';

    installPhase = ''
      cp package-lock.json $out
    '';

    outputHashMode = "flat";
    outputHashAlgo = "sha256";
    outputHash = "sha256-h7CXp+wxDaUXGQn3BSGxduDktE4LybDGNCa2COCuMC4=";
  };

  src-with-lock =
    with pkgs;
    stdenv.mkDerivation {
      name = "imba-src-with-lock";
      src = imba-src;

      installPhase = ''
        mkdir -p $out
        cp -r . $out
        cp ${imba-lock} $out/package-lock.json
      '';
    };
in
{
  home.packages = [
    (pkgs.buildNpmPackage {
      pname = "imba";
      version = "2.0.0-alpha.253";

      src = src-with-lock;

      npmDepsHash = "sha256-dTBsHrpYHes1ZTgh1amora/BCcecqnhSVdPXG5Pm6/E=";

      dontNpmBuild = true;
      npmFlags = [ "--ignore-scripts" ];
      nativeBuildInputs = with pkgs; [
        esbuild
        makeWrapper
      ];

      # ESBUILD_BINARY_PATH = lib.getExe pkgs.esbuild;

      installPhase = ''
        runHook preInstall

        # dir in the Nix store
        mkdir -p $out/lib/node_modules/imba

        cp -r . $out/lib/node_modules/imba

        # syms
        mkdir -p $out/bin
        ln -s $out/lib/node_modules/imba/bin/imba $out/bin/imba
        ln -s $out/lib/node_modules/imba/bin/imbac $out/bin/imbac

        runHook postInstall
      '';

      postInstall = ''
        # wrap for esbuild
        wrapProgram $out/bin/imba \
          --set ESBUILD_BINARY_PATH ${lib.getExe pkgs.esbuild}

        wrapProgram $out/bin/imbac \
          --set ESBUILD_BINARY_PATH ${lib.getExe pkgs.esbuild}

        # broken monorepo symlink for some reason
        rm -rf $out/lib/node_modules/imba/node_modules/imba-monarch
      '';

      meta = {
        description = "The Imba Programming Language";
        homepage = "https://imba.io/";
        license = lib.licenses.mit;
        mainProgram = "imba";
      };
    })
  ];
}
