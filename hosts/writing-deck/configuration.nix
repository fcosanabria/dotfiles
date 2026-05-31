{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ../../modules/home/tmux.nix
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 5;
  boot.loader.timeout = 10;
  boot.loader.efi.canTouchEfiVariables = true;

  # Hostname
  networking.hostName = "writing-deck";

  # Networking - NetworkManager with nmtui
  networking.networkmanager.enable = true;

  # Timezone
  time.timeZone = "America/Costa_Rica";

  # Locale
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_CR.UTF-8";
    LC_IDENTIFICATION = "es_CR.UTF-8";
    LC_MEASUREMENT = "es_CR.UTF-8";
    LC_MONETARY = "es_CR.UTF-8";
    LC_NAME = "es_CR.UTF-8";
    LC_NUMERIC = "es_CR.UTF-8";
    LC_PAPER = "es_CR.UTF-8";
    LC_TELEPHONE = "es_CR.UTF-8";
    LC_TIME = "es_CR.UTF-8";
  };

  # No X11/Wayland - pure console setup

  # Fish must be enabled system-wide to be used as login shell
  programs.fish.enable = true;

  # kmscon - modern console with Adwaita Mono Nerd Font, autologin
  programs.kmscon = {
    enable = true;
    autologinUser = "fsanabria";
    fonts = [
      { name = "Adwaita Mono"; package = pkgs.nerd-fonts.adwaita-mono; }
    ];
    extraConfig = ''
      font-size=12
    '';
  };

  # Nix Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Garbage Collector
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # Packages - minimal set for writing deck
  environment.systemPackages = with pkgs; [
    git
    tmux
    fish
    acpi
    light
    htop
    wget
    curl
    tree
  ];

  # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.adwaita-mono
  ];

  # User account
  users.users.fsanabria = {
    isNormalUser = true;
    description = "Francisco Sanabria";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
  };

  # lazyvim-nix home-manager module (correct placement)
  home-manager.sharedModules = [ inputs.lazyvim-nix.homeManagerModules.default ];

  # Home Manager
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "hm-backup";
  home-manager.users.fsanabria = { pkgs, ... }: {
    home.username = "fsanabria";
    home.homeDirectory = "/home/fsanabria";
    home.stateVersion = "25.11";

    # LazyVim
    programs.lazyvim = {
      enable = true;
      installCoreDependencies = true;

      extras = {
        lang.python = {
          enable = true;
          installDependencies = true;
        };
      };

      config = {
        options = ''
          vim.opt.wrap = true
          vim.opt.linebreak = true
          vim.opt.relativenumber = true
          vim.opt.number = true
        '';

        keymaps = ''
          vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
        '';
      };

      plugins = {
        teide = ''
          return {
            "serhez/teide.nvim",
            lazy = false,
            priority = 1000,
            opts = {
              style = "darker",
              light_style = "darker",
              transparent = false,
              terminal_colors = true,
              styles = {
                comments = { italic = true },
                keywords = { italic = true },
                functions = {},
                variables = {},
                sidebars = "dark",
                floats = "dark",
              },
              dim_inactive = false,
              lualine_bold = false,
            },
            config = function(_, opts)
              require("teide").setup(opts)
              vim.cmd.colorscheme("teide-darker")
            end,
          }
        '';

        obsidian = ''
          return {
            "obsidian-nvim/obsidian.nvim",
            version = "*",
            keys = {
              { "<leader>of", "<cmd>Obsidian quick_switch<cr>",      desc = "Find note" },
              { "<leader>os", "<cmd>Obsidian search<cr>",            desc = "Search notes" },
              { "<leader>ow", "<cmd>Obsidian workspace<cr>",         desc = "Switch workspace" },
              { "<leader>on", "<cmd>Obsidian new<cr>",               desc = "New note" },
              { "<leader>oN", "<cmd>Obsidian new_from_template<cr>", desc = "New from template" },
              { "<leader>ou", "<cmd>Obsidian unique_note<cr>",       desc = "New unique note" },
              { "<leader>od", "<cmd>Obsidian today<cr>",             desc = "Today" },
              { "<leader>oD", "<cmd>Obsidian dailies<cr>",           desc = "Dailies picker" },
              { "<leader>o]", "<cmd>Obsidian tomorrow<cr>",          desc = "Tomorrow" },
              { "<leader>o[", "<cmd>Obsidian yesterday<cr>",         desc = "Yesterday" },
              { "<leader>ob", "<cmd>Obsidian backlinks<cr>",         desc = "Backlinks" },
              { "<leader>ol", "<cmd>Obsidian links<cr>",             desc = "Links in note" },
              { "<leader>oc", "<cmd>Obsidian toc<cr>",               desc = "Table of contents" },
              { "<leader>ot", "<cmd>Obsidian tags<cr>",              desc = "Tags" },
              { "<leader>oi", "<cmd>Obsidian template<cr>",          desc = "Insert template" },
              { "<leader>op", "<cmd>Obsidian paste_img<cr>",         desc = "Paste image" },
              { "<leader>or", "<cmd>Obsidian rename<cr>",            desc = "Rename note" },
              { "<leader>ox", "<cmd>Obsidian toggle_checkbox<cr>",   desc = "Toggle checkbox" },
              { "<leader>oF", "<cmd>Obsidian follow_link<cr>",       desc = "Follow link" },
              { "<leader>oo", "<cmd>Obsidian open<cr>",              desc = "Open in app" },
              { "<leader>oe", "<cmd>Obsidian extract_note<cr>",      desc = "Extract to note",  mode = "v" },
              { "<leader>ok", "<cmd>Obsidian link<cr>",              desc = "Link selection",   mode = "v" },
              { "<leader>oK", "<cmd>Obsidian link_new<cr>",          desc = "Link to new note", mode = "v" },
            },
            opts = {
              legacy_commands = false,
              note_id_func = function(title)
                local slug = require("obsidian.builtin").title_id(title)
                return os.date("%Y-%m-%d") .. "-" .. slug
              end,
              daily_notes = {
                folder = "daily-notes",
              },
              workspaces = {
                {
                  name = "personal",
                  path = "~/Notes/",
                },
              },
            },
          }
        '';
      };
    };

    # Git
    programs.git = {
      enable = true;
      settings.user.name = "Francisco Sanabria";
      settings.user.email = "fsanabria@fastmail.com";
    };

    # Fish - auto-launch tmux on tty1 login
    programs.fish = {
      enable = true;
      loginShellInit = ''
        # Auto-launch tmux with nvim on tty1
        if not set -q TMUX; and test (tty) = /dev/tty1
            exec tmux new-session nvim
        end
      '';
    };
  };

  # Syncthing service
  services.syncthing = {
    enable = true;
    user = "fsanabria";
    dataDir = "/home/fsanabria/.syncthing";
  };

  system.stateVersion = "25.11";
}
