{
  programs.yazi = {
    enable = true;
    settings = {
      mgr = {
        show_hidden = true;
        sort_by = "mtime";
        sort_reverse = true;
        sort_dir_frist = true;
      };
      opener = {
        edit = [
          { run = "nvim %s"; block = true; for = "unix"; }
        ];
        open = [
          { run = "xdg-open %s1"; desc = "Open"; }
        ];
        play = [
          { run = "mpv %s"; orphan = true; for = "unix"; }
        ];
      };
    };
  };
}
