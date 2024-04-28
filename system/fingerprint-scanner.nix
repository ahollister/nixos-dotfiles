{ nixos-06cb-009a-fingerprint-sensor, ... }:

{
  services.fprintd = {
    enable = true;
    tod = {
      enable = true;
      driver = nixos-06cb-009a-fingerprint-sensor.lib.libfprint-2-tod1-vfs0090-bingch {
        calib-data-file = ./calib-data.bin;
      };
    };
  };
}
