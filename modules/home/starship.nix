{ config, pkgs, ... }:

{
  home-manager.users.fsanabria = {
    programs.starship = {
      enable = true;
      enableFishIntegration = true;

      settings = {
        format = "$os $username $directory $c$cpp$rust$golang$nodejs$php$java$kotlin$haskell$python $git_branch$git_status $line_break$time $character";

        palette = "oxocarbon";

        palettes.oxocarbon = {
          color_bg     = "#161616";
          color_fg     = "#dde1e6";
          color_dim    = "#b0b0b0";
          color_red    = "#ee5396";
          color_green  = "#42be65";
          color_blue   = "#33b1ff";
          color_cyan   = "#3ddbd9";
          color_purple = "#be95ff";
          color_yellow = "#ffe97b";
          color_teal   = "#08bdba";
        };

        os = {
          disabled = false;
          style = "bold fg:#ee5396";
          format = "[$symbol]($style)";
        };

        os.symbols = {
          NixOS = "";
          Windows = "󰍲";
          Ubuntu = "󰕈";
          SUSE = "";
          Raspbian = "󰐿";
          Mint = "󰣭";
          Macos = "󰀵";
          Manjaro = "";
          Linux = "";
          Gentoo = "󰣨";
          Fedora = "󰣛";
          Alpine = "";
          Amazon = "";
          Android = "";
          AOSC = "";
          Arch = "󰣇";
          Artix = "󰣇";
          EndeavourOS = "";
          CentOS = "";
          Debian = "󰣚";
          Redhat = "󱄛";
          RedHatEnterprise = "󱄛";
          Pop = "";
        };

        username = {
          show_always = true;
          style_user = "fg:#b0b0b0";
          style_root = "fg:#ee5396";
          format = "[$user]($style)";
        };

        directory = {
          style = "bold fg:#33b1ff";
          format = "[$path]($style)";
          truncation_length = 3;
          truncation_symbol = "…/";
          read_only = " 󰗾";
        };

        directory.substitutions = {
          "Documents" = "󰈙 ";
          "Downloads" = " ";
          "Music" = "󰝚 ";
          "Pictures" = " ";
          "Developer" = "󰲋 ";
        };

        git_branch = {
          style = "bold fg:#3ddbd9";
          format = "[$symbol$branch]($style)";
        };

        git_status = {
          style = "fg:#ffe97b";
          format = "[$all_status$ahead_behind]($style)";
        };

        c = {
          symbol = "C ";
          style = "bold fg:#08bdba";
          format = "[$symbol($version)]($style)";
        };

        cpp = {
          symbol = "C++ ";
          style = "bold fg:#08bdba";
          format = "[$symbol($version)]($style)";
        };

        rust = {
          symbol = "";
          style = "bold fg:#08bdba";
          format = "[$symbol($version)]($style)";
        };

        golang = {
          symbol = "";
          style = "bold fg:#08bdba";
          format = "[$symbol($version)]($style)";
        };

        nodejs = {
          symbol = "";
          style = "bold fg:#08bdba";
          format = "[$symbol($version)]($style)";
        };

        php = {
          symbol = "";
          style = "bold fg:#08bdba";
          format = "[$symbol($version)]($style)";
        };

        java = {
          symbol = "";
          style = "bold fg:#08bdba";
          format = "[$symbol($version)]($style)";
        };

        kotlin = {
          symbol = "";
          style = "bold fg:#08bdba";
          format = "[$symbol($version)]($style)";
        };

        haskell = {
          symbol = "";
          style = "bold fg:#08bdba";
          format = "[$symbol($version)]($style)";
        };

        python = {
          symbol = "";
          style = "bold fg:#08bdba";
          format = "[$symbol($version)]($style)";
        };

        docker_context = {
          symbol = "";
          style = "fg:#b0b0b0";
          format = "[$symbol($context)]($style)";
        };

        conda = {
          style = "fg:#b0b0b0";
          format = "[$symbol($environment)]($style)";
        };

        pixi = {
          style = "fg:#b0b0b0";
          format = "[$symbol($version)($environment)]($style)";
        };

        time = {
          disabled = false;
          time_format = "%R";
          style = "fg:#b0b0b0";
          format = "[$time]($style)";
        };

        line_break.disabled = false;

        character = {
          disabled = false;
          success_symbol = "[❯](bold fg:#42be65)";
          error_symbol = "[❯](bold fg:#ee5396)";
          vimcmd_symbol = "[❯](bold fg:#42be65)";
          vimcmd_replace_one_symbol = "[❯](bold fg:#be95ff)";
          vimcmd_replace_symbol = "[❯](bold fg:#be95ff)";
          vimcmd_visual_symbol = "[❯](bold fg:#33b1ff)";
        };
      };
    };
  };
}
