{ config, lib, pkgs, ... }:

{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        font = "JetBrainsMono Nerd Font Bold 11";
        offset = "17x26";
	width = "250x500";
        height = "0x750";
        markup = "full";
        format = "<b>%s</b>\n%b";
        sort = false;
        indicate_hidden = true;
        alignment = "left";
        show_age_threshold = 60;
        word_wrap = true;
        ignore_newline = false;
        stack_duplicates = false;
        hide_duplicate_count = true;
        corner_radius = 0;
        shrink = false;
        idle_threshold = 120;
        monitor = 0;
        follow = "mouse";
        sticky_history = true;
        history_length = 5;
        show_indicators = false;
        line_height = 0;
        separator_height = 0;
        padding = 5;
        horizontal_padding = 5;
        separator_color = "auto";
        startup_notification = true;
        browser = "x-www-browser -new-tab";
        always_run_script = true;
        title = "Dunst";
        class = "Dunst";
        icon_position = "left";
	gap_size = 3;
	min_icon_size=32;
        max_icon_size = 32;
        frame_width = 1;
	frame_color="#607566";
      };

      shortcuts = {
        close = "ctrl+shift+space";
        close_all = "ctrl+shift+space";
        history = "ctrl+grave";
        context = "ctrl+shift+period";
      };

      urgency_low = {
        foreground = "#d8dee9";
        background = "#2e3440";
        timeout = 5;
      };

      urgency_normal = {
        foreground = "#d8dee9";
        background = "#2e3440";
        timeout = 5;
      };

      urgency_critical = {
        foreground = "#d8dee9";
        background = "#2e3440";
        timeout = 5;
      };
    };
  };
}
