{ inputs, pkgs, ... }: {
  programs.steam = {
    package =
      with pkgs;
      steam.override {
        extraEnv = {
          LD_AUDIT = "${
            with inputs; sls-steam.packages.${pkgs.stdenv.hostPlatform.system}.sls-steam
          }/library-inject.so:${
            with inputs; sls-steam.packages.${pkgs.stdenv.hostPlatform.system}.sls-steam
          }/SLSsteam.so";
        };
      };
  };
}
