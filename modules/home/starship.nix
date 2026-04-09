{ config, pkgs, ... }:

{
  home-manager.users.fsanabria = {
    programs.starship = {
      enable = true;
      enableFishIntegration = true;

      # This generates ~/.config/starship.toml automatically
      settings = {
        add_newline = true;
        command_timeout = 2000;

        format = "\$env_var\$os\$username\$hostname\$kubernetes\$directory\$git_branch\$git_status\$python\n\$character\n";

        character = {
          success_symbol = "╰⎯";
          error_symbol = "╰⎯";
        };

        env_var = {
          symbol = "╭╴";
          variable = "SHELL";
          format = "$symbol";
          disabled = false;
        };

        os = {
          format = "[$symbol](bold white) ";
          disabled = false;
        };

        os.symbols = {
          Windows = " ";
          Arch = "󰣇";
          Ubuntu = "";
          Macos = "󰀵";
          Unknown = "󰠥";
        };

        username = {
          style_user = "yellow bold";
          style_root = "black bold";
          format = "[//](black bold) [$user](#2883ff) ";
          disabled = false;
          show_always = true;
        };

        hostname = {
          ssh_only = false;
          format = "[//](black bold) [$hostname](bold blue) ";
          disabled = false;
        };

        directory = {
          truncation_length = 0;
          truncation_symbol = "…/";
          home_symbol = "~";
          read_only = "  ";
          format = "[//](black bold) [$path]($style)[$read_only]($read_only_style) ";
          style = "#7ed1fb";
        };

        git_branch = {
          symbol = " ";
          format = "[//](black bold) [$symbol\\[$branch\\]]($style) ";
          style = "bold green";
        };

        git_status = {
          disabled = true;
          format = "[ $all_status $ahead_behind]($style) ";
          style = "bold green";
          conflicted = "🏳";
          up_to_date = "";
          untracked = " ";
          ahead = "⇡\${count}";
          diverged = "⇕⇡\${ahead_count}⇣\${behind_count}";
          behind = "⇣\${count}";
          stashed = " ";
          modified = " ";
          staged = "[++\\($count\\)](green)";
          renamed = "襁 ";
          deleted = " ";
        };

        kubernetes = {
          format = "via [󱃾 $context\\($namespace\\)](bold purple) ";
          disabled = false;
        };

        vagrant.disabled = true;
        docker_context.disabled = true;
        helm.disabled = true;
        nodejs.disabled = true;
        ruby.disabled = true;
        terraform.disabled = true;

        python = {
          symbol = "󰌠";
          python_binary = [ "./venv/bin/python" "python" "python3" "python2" ];
          format = "[//](black bold) [\${symbol} \${pyenv_prefix}(\${version} )(\\($virtualenv\\) )]($style) ";
        };
      };
    };
  };
}
