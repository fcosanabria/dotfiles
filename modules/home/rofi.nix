{ config, pkgs, lib, ... }:

{
  config = lib.mkIf config.programs.sway.enable {
  home-manager.users.fsanabria = {
    programs.rofi = {
      enable = true;
      terminal = "ghostty";
      font = "Berkeley Mono 12";
      theme = "teide-dark";
    };

    xdg.configFile."rofi/themes/teide-dark.rasi".text = ''
      * {
        bg0:   #323232;
        bg1:   #222222;
        bg2:   #285577;
        bg3:   #4c7899;
        fg0:   #ffffff;
        fg1:   #888888;
        blue:  #4c7899;
        green: #66ccff;
        red:   #ff6666;
        sep:   #333333;
      }

      window {
        background-color: @bg0;
        border:           1px solid;
        border-color:     @sep;
        border-radius:    0px;
        width:            600px;
        padding:          0px;
      }

      mainbox {
        background-color: @bg0;
        children:         [inputbar, listview];
        spacing:          0px;
        padding:          0px;
      }

      inputbar {
        children:         [prompt, entry];
        background-color: @bg1;
        border-radius:    0px;
        padding:          14px 18px;
        border:           0px 0px 1px 0px;
        border-color:     @sep;
        spacing:          10px;
      }

      prompt {
        background-color: @bg1;
        text-color:       @blue;
        vertical-align:   0.5;
      }

      entry {
        background-color: @bg1;
        text-color:       @fg0;
        placeholder:      "Search...";
        placeholder-color: @fg1;
        vertical-align:   0.5;
      }

      listview {
        background-color: @bg0;
        padding:          8px;
        spacing:          2px;
        lines:            9;
        fixed-height:     false;
        scrollbar:        false;
      }

      element {
        background-color: @bg0;
        padding:          10px 12px;
        border-radius:    0px;
        spacing:          10px;
        cursor:           pointer;
      }

      element normal.normal {
        background-color: @bg0;
        text-color:       @fg1;
      }

      element alternate.normal {
        background-color: @bg0;
        text-color:       @fg1;
      }

      element selected.normal {
        background-color: @bg2;
        text-color:       @fg0;
      }

      element normal.urgent {
        background-color: @bg0;
        text-color:       @red;
      }

      element alternate.urgent {
        background-color: @bg0;
        text-color:       @red;
      }

      element selected.urgent {
        background-color: @bg2;
        text-color:       @red;
      }

      element normal.active {
        background-color: @bg0;
        text-color:       @green;
      }

      element alternate.active {
        background-color: @bg0;
        text-color:       @green;
      }

      element selected.active {
        background-color: @bg2;
        text-color:       @green;
      }

      element-icon {
        background-color: inherit;
        size:             1.1em;
        vertical-align:   0.5;
      }

      element-text {
        background-color: inherit;
        text-color:       inherit;
        vertical-align:   0.5;
      }
    '';
  };
  };
}
