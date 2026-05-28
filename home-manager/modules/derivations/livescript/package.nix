{
  pkgs,
  ...
}:
pkgs.buildNpmPackage rec {
  pname = "livescript";
  version = "1.6.1";

  src = pkgs.fetchFromGitHub {
    owner = "gkz";
    repo = "LiveScript";
    rev = version;
    hash = "sha256-H1h2Qaiod6wI4XsTlW9oCCzlm5pgTXubfgnj82HLkx0=";
  };

  postPatch = ''
    cp ${./package-lock.json} package-lock.json
  '';

  npmDepsHash = "sha256-+X6OA3yLU0UhLLLltyIyau36uQu4iyySbqFQUMdI/JQ=";

  dontNpmBuild = true;
}
