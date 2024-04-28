{ ... }:

{
  programs.swaylock = {
    enable = true;
    settings = {
      color = "ffffff";
      font = "JetBrains Mono";
      font-size = 16;
      indicator-idle-visible = false;
      indicator-radius = 70;

      inside-color = "00000099";

      inside-clear-color = "ffd20400";
      inside-caps-lock-color = "009ddc00";
      inside-ver-color = "d9d8d800";
      inside-wrong-color = "ee2e2400";

      ring-color = "00000000";
      ring-clear-color = "00000000";
      ring-caps-lock-color = "231f20D9";
      ring-ver-color = "231f20D9";
      ring-wrong-color = "231f20D9";

      line-color = "00000000";
      line-clear-color = "00000000";
      line-caps-lock-color = "009ddcFF";
      line-ver-color = "d9d8d8FF";
      line-wrong-color = "ee2e24FF";

      show-failed-attempts = true;
      image = "~/Documents/wallpapers/animals-ramenbar-blurred.jpg";
    };
  };
}
