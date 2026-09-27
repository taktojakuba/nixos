{ config, ... }:
let
  c = config.lib.stylix.colors.withHashtag;
in
{
  xdg.configFile."vesktop/themes/system24.theme.css".text = ''
    /**
     * @name system24
     * @description a tui-style discord theme.
     * @author refact0r
     * @version 2.0.0
     * @source https://github.com/refact0r/system24
     */

    @import url('https://refact0r.github.io/system24/build/system24.css');

    body {
      --font: 'DM Mono';
      --code-font: 'DM Mono';
      font-weight: 300;
      letter-spacing: -0.05ch;

      --gap: 12px;
      --divider-thickness: 4px;
      --border-thickness: 2px;
      --border-hover-transition: 0.2s ease;

      --animations: on;
      --list-item-transition: 0.2s ease;
      --dms-icon-svg-transition: 0.4s ease;

      --top-bar-height: var(--gap);
      --top-bar-button-position: titlebar;
      --top-bar-title-position: off;
      --subtle-top-bar-title: off;

      --custom-window-controls: off;
      --window-control-size: 14px;

      --custom-dms-icon: off;
      --custom-dms-background: off;

      --background-image: off;

      --transparency-tweaks: off;
      --remove-bg-layer: off;
      --panel-blur: off;

      --small-user-panel: on;
      --unrounding: on;

      --custom-spotify-bar: on;
      --ascii-titles: on;
      --ascii-loader: system24;

      --panel-labels: on;
      --label-color: var(--text-muted);
      --label-font-weight: 500;
    }

    :root {
      --colors: on;

      --text-0: ${c.base00};
      --text-1: ${c.base05};
      --text-2: ${c.base06};
      --text-3: ${c.base04};
      --text-4: ${c.base03};
      --text-5: ${c.base02};

      --bg-1: ${c.base02};
      --bg-2: ${c.base03};
      --bg-3: ${c.base01};
      --bg-4: ${c.base00};
      --hover: ${c.base04};
      --active: ${c.base04};
      --message-hover: ${c.base04};

      --accent-1: ${c.base0E};
      --accent-2: ${c.base0D};
      --accent-3: ${c.base0D};
      --accent-4: ${c.base04};
      --accent-5: ${c.base0C};
      --accent-new: ${c.base0C};
      --mention: ${c.base01};
      --mention-hover: ${c.base04};
      --reply: linear-gradient(to right, color-mix(in hsl, var(--text-3), transparent 90%) 40%, transparent);
      --reply-hover: linear-gradient(to right, color-mix(in hsl, var(--text-3), transparent 95%) 40%, transparent);

      --online-indicator: ${c.base0C};
      --dnd-indicator: ${c.base08};
      --idle-indicator: ${c.base0A};
      --streaming-indicator: ${c.base0E};
      --offline: var(--text-4);

      --border-light: var(--hover);
      --border: var(--active);
      --border-hover: var(--accent-2);
      --button-border: hsl(220, 0%, 100%, 0.1);
    }
  '';
}
