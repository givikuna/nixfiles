{ pkgs, ... }: {
  programs.gpu-screen-recorder = {
    enable = true;
    package = with pkgs; gpu-screen-recorder;

    ui = {
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    gpu-screen-recorder
    gpu-screen-recorder-gtk
    gpu-screen-recorder-notification
    gpu-screen-recorder-ui
  ];
}
