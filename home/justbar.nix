{ config, ... }:
let
  c = config.lib.stylix.colors.withHashtag;
in
{
  xdg.configFile."justbar/config.toml".text = ''
    [bar]
    height = 20
    spacing = 0
    padding = 0
    position = "top"
    font = "JetBrainsMono Nerd Font 10"
    background = "${c.base00}"
    foreground = "${c.base05}"

    [[modules]]
    name = "weather"
    exec = "printf '[ weather: %s]' \"$(curl -s 'wttr.in/?format=%C')\""
    interval = 1800
    align = "left"
    color = "${c.base0D}"

    [[modules]]
    name = "music"
    exec = "printf '|[%s]' \"$(playerctl metadata title)\""
    interval = 1
    align = "left"
    color = "${c.base0D}"

    [[modules]]
    name = "clock"
    format = "[%H:%M | %a %d %b]"
    interval = 1
    align = "center"
    color = "${c.base0D}"

    [[modules]]
    name = "prof"
    exec = "printf '[ prof: %s' \"$(powerprofilesctl get)\""
    interval = 5
    align = "right"
    color = "${c.base0D}"

    [[modules]]
    name = "batt"
    exec = "printf '/ batt: %s%%' \"$(grep . /sys/class/power_supply/BAT*/capacity 2>/dev/null | head -1 | cut -d: -f2)\""
    interval = 30
    align = "right"
    color = "${c.base0D}"

    [[modules]]
    name = "wifi"
    exec = "printf '/ wifi: %s' \"$(tr a-z A-Z < /sys/class/net/wlp4s0/operstate)\""
    interval = 10
    align = "right"
    color = "${c.base0D}"

    [[modules]]
    name = "vol"
    exec = "printf '/ vol: %s%%' \"$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{printf \"%.0f\", $2*100}')\""
    interval = 2
    align = "right"
    color = "${c.base0D}"

    [[modules]]
    name = "ram"
    exec = "printf '/ ram: %s%%' \"$(free | awk '/Mem/{printf \"%.0f\", $3/$2*100}')\""
    interval = 5
    align = "right"
    color = "${c.base0D}"

    [[modules]]
    name = "cpu"
    exec = "printf '/ cpu: %s%% ]' \"$(top -bn1 | grep 'Cpu(s)' | awk '{printf \"%.0f\", 100-$8}')\""
    interval = 2
    align = "right"
    color = "${c.base0D}"
  '';
}
