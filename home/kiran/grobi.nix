{ pkgs, ... }: {
  services.grobi = {
    enable = true;
    rules = [
      {
        name = "Home";
        outputs_connected = [ "HDMI1" "eDP1" ];
        primary = "HDMI1";
        atomic = true;
        configure_row = [ "HDMI1" "eDP1" ];
      }
    ];
  };
}
