{
  lib,
  python3,
  fetchFromGitHub,
}:
python3.pkgs.buildPythonApplication rec {
  pname = "sherlock-project";
  version = "0.16.0";

  src = fetchFromGitHub {
    owner = "sherlock-project";
    repo = "sherlock";
    rev = "v${version}";
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };

  format = "pyproject";

  propagatedBuildInputs = with python3.pkgs; [
    certifi
    colorama
    pysocks
    requests
    requests-futures
    stem
    pandas
    openpyxl
    tomli
  ];

  postPatch = ''
    substituteInPlace sherlock_project/sites.py \
      --replace-fail 'data_file_path = MANIFEST_URL' \
      'data_file_path = os.path.join(os.path.dirname(__file__), "resources", data.json)'
  '';

  doCheck = false;

  meta = with lib; {
    description = "Hunt down social media accounts by username across social networks";
    homepage = "https://sherlockproject.xyz/";
    license = licenses.mit;
    maintainers = [ "givikuna" ];
    mainProgram = "sherlock";
  };
}
