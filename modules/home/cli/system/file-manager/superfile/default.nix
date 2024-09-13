{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) inputs;
      bind = key: [
        key
        ""
      ];
    in
    {
      path = ./.;
      nixPkgs = "superfile";
      # confs = {
      #   "superfile/config.toml" = inputs.nix-std.lib.serde.toTOML {
      #     theme = "catppuccin";
      #     auto_check_update = false;
      #     cd_on_quit = false;
      #     default_open_file_preview = true;
      #     default_directory = ".";
      #     file_size_use_si = false;
      #     nerdfont = true;
      #     transparent_background = true;
      #     file_preview_width = 0;
      #     sidebar_width = 20;
      #     metadata = false;
      #     enable_md5_checksum = false;
      #   };
      #   "superfile/hotkeys.toml" = inputs.nix-std.lib.serde.toTOML {
      #     confirm = bind "enter";
      #     quit = bind "ctrl+c";
      #     list_up = bind "k";
      #     list_down = bind "j";
      #     create_new_file_panel = bind "n";
      #     close_file_panel = bind "q";
      #     next_file_panel = bind "tab";
      #     previous_file_panel = bind "shift+tab";
      #     toggle_file_preview_panel = bind "f";
      #     focus_on_process_bar = bind "ctrl+p";
      #     focus_on_sidebar = bind "ctrl+s";
      #     focus_on_metadata = bind "ctrl+m";
      #     file_panel_item_create = bind "a";
      #     file_panel_item_rename = bind "r";
      #     copy_items = bind "y";
      #     cut_items = bind "x";
      #     paste_items = bind "p";
      #     delete_items = bind "d";
      #     extract_file = bind "ctrl+e";
      #     compress_file = bind "ctrl+a";
      #     open_file_with_editor = bind "e";
      #     open_current_directory_with_editor = bind "E";
      #     pinned_directory = bind "P";
      #     toggle_dot_file = bind ".";
      #     change_panel_mode = bind "m";
      #     open_help_menu = bind "?";
      #     open_command_line = bind ":";
      #     confirm_typing = bind "enter";
      #     cancel_typing = bind "esc";
      #     parent_directory = bind "-";
      #     search_bar = bind "/";
      #     file_panel_select_mode_items_select_down = bind "J";
      #     file_panel_select_mode_items_select_up = bind "K";
      #     file_panel_select_all_items = bind "A";
      #   };
      # };
    }
  )
)
