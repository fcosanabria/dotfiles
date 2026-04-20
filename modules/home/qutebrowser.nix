{ config, pkgs, lib, ... }:

{
  home-manager.users.fsanabria = {

    programs.qutebrowser = {
      enable = true;

      # ── Search Engines ─────────────────────────────────────────────────
      # Syntax: "alias" = "url con {} donde va el query"
      # Se usan escribiendo `:open alias query` o directamente `o alias query`
      # DEFAULT es el engine que se usa cuando no pones alias (solo escribes texto)
      searchEngines = {
        DEFAULT = "https://kagi.com/search?q={}";
        k = "https://kagi.com/search?q={}";
        g = "https://www.google.com/search?q={}";
        yt = "https://www.youtube.com/results?search_query={}";
        gh = "https://github.com/search?q={}";
        nw = "https://wiki.nixos.org/w/index.php?search={}";
        np = "https://search.nixos.org/packages?query={}";
        no = "https://search.nixos.org/options?query={}";
        aw = "https://wiki.archlinux.org/?search={}";
        wp = "https://en.wikipedia.org/w/index.php?search={}";
        rd = "https://www.reddit.com/search/?q={}";
      };

      # ── Settings ───────────────────────────────────────────────────────
      # Cada key aqui mapea a `c.key.subkey = value` en config.py
      # Puedes explorar todos con `:set` dentro de qutebrowser
      settings = {

        # -- General --
        # No cargar autoconfig.yml (todo queda declarativo en este archivo)
        auto_save.session = true;              # Restaurar tabs al reabrir

        # -- URLs --
        url.start_pages = [ "https://kagi.com" ];
        url.default_page = "https://kagi.com";

        # -- Editor --
        # {file} y {line} son placeholders que qutebrowser reemplaza
        # Ctrl-e en un input abre tu editor con el contenido del campo
        editor.command = [ "ghostty" "-e" "nvim" "+{line}" "{file}" ];

        # -- Tabs --
        tabs.position = "top";
        tabs.show = "multiple";                # "always", "never", "multiple", "switching"
        tabs.last_close = "close";             # Que hacer al cerrar la ultima tab
        tabs.background = true;                # Tabs nuevas se abren en background
        tabs.title.format = "{audio}{index}: {current_title}";

        # -- Completion --
        # La barra de completado que aparece al escribir :commands o URLs
        completion.height = "30%";
        completion.shrink = true;              # Se encoge si hay pocos resultados

        # -- Content --
        content.javascript.clipboard = "access";  # Permitir que JS acceda al clipboard
        content.pdfjs = true;                      # Ver PDFs en el browser en vez de descargar
        content.autoplay = false;                  # No autoplay de videos

        # -- Scrolling --
        scrolling.smooth = true;

        # -- Downloads --
        downloads.location.directory = "~/Downloads";
        downloads.location.prompt = false;     # No preguntar donde guardar

        # -- Dark mode --
        # Fuerza dark mode en paginas web via CSS injection
        # Prueba y desactiva si algun sitio se ve mal
        colors.webpage.darkmode.enabled = true;
        colors.webpage.preferred_color_scheme = "dark";

        # -- Hints --
        # Las letras que aparecen cuando presionas `f` para seguir links
        # Home row keys para que sean faciles de alcanzar
        hints.chars = "asdfghjkl";

        # -- Fonts --
        fonts.default_family = [ "BerkeleyMono Nerd Font Mono" ];
        fonts.default_size = "12pt";

        # -- Gruvbox Dark Hard colors --
        # bg0_hard = #1d2021, bg0 = #282828, bg1 = #3c3836, bg2 = #504945
        # fg = #ebdbb2, fg1 = #d5c4a1
        # red = #fb4934, green = #b8bb26, yellow = #fabd2f
        # blue = #83a598, purple = #d3869b, aqua = #8ec07c, orange = #fe8019

        colors.completion.fg = "#ebdbb2";
        colors.completion.odd.bg = "#1d2021";
        colors.completion.even.bg = "#282828";
        colors.completion.category.fg = "#fabd2f";
        colors.completion.category.bg = "#1d2021";
        colors.completion.item.selected.fg = "#1d2021";
        colors.completion.item.selected.bg = "#fabd2f";
        colors.completion.match.fg = "#b8bb26";

        colors.statusbar.normal.fg = "#ebdbb2";
        colors.statusbar.normal.bg = "#1d2021";
        colors.statusbar.command.fg = "#ebdbb2";
        colors.statusbar.command.bg = "#1d2021";
        colors.statusbar.insert.fg = "#1d2021";
        colors.statusbar.insert.bg = "#b8bb26";

        colors.tabs.bar.bg = "#1d2021";
        colors.tabs.odd.fg = "#ebdbb2";
        colors.tabs.odd.bg = "#3c3836";
        colors.tabs.even.fg = "#ebdbb2";
        colors.tabs.even.bg = "#504945";
        colors.tabs.selected.odd.fg = "#1d2021";
        colors.tabs.selected.odd.bg = "#fabd2f";
        colors.tabs.selected.even.fg = "#1d2021";
        colors.tabs.selected.even.bg = "#fabd2f";

        colors.hints.fg = "#1d2021";
        colors.hints.bg = "#fabd2f";
        colors.hints.match.fg = "#fb4934";

        colors.messages.error.fg = "#ebdbb2";
        colors.messages.error.bg = "#fb4934";
        colors.messages.warning.fg = "#1d2021";
        colors.messages.warning.bg = "#fabd2f";
        colors.messages.info.fg = "#ebdbb2";
        colors.messages.info.bg = "#1d2021";
      };

      # ── Keybindings ────────────────────────────────────────────────────
      # Formato: mode = { "key" = "command"; }
      # Modos: normal, insert, hint, command, passthrough, caret, prompt
      #
      # Tip: en qutebrowser puedes ver todos los bindings con :bind
      keyBindings = {

        normal = {
          # -- Navegacion de tabs (estilo vim) --
          "J" = "tab-prev";                    # J/K para cambiar tabs
          "K" = "tab-next";
          "gT" = "tab-prev";                   # Alternativa clasica de Vim
          "gt" = "tab-next";
          "x" = "tab-close";                   # Cerrar tab rapido
          "X" = "undo";                        # Re-abrir tab cerrada
          "t" = "set-cmd-text -s :open -t";    # Nueva tab (pre-llena :open -t)

          # -- Navegacion rapida --
          "H" = "back";                        # Historial atras/adelante
          "L" = "forward";

          # -- Bookmarks / quickmarks --
          # qutebrowser tiene 2 sistemas:
          #   bookmarks: URL guardada con :bookmark-add
          #   quickmarks: URL guardada con un nombre (alias)
          "B" = "set-cmd-text -s :quickmark-load -t";   # Abrir quickmark en nueva tab
          "b" = "set-cmd-text -s :quickmark-load";       # Abrir quickmark en tab actual

          # -- Clipboard --
          "p" = "open -- {clipboard}";         # Abrir URL del clipboard
          "P" = "open -t -- {clipboard}";      # ...en nueva tab
          "yy" = "yank";                       # Copiar URL actual
          "yt" = "yank title";                 # Copiar titulo
          "yd" = "yank domain";                # Copiar dominio

          # -- Hints avanzados --
          # `f` y `F` ya estan mapeados por defecto (follow hint / follow in new tab)
          ";y" = "hint links yank";            # Copiar URL de un link
          ";d" = "hint links download";        # Descargar el target de un link
          ";o" = "hint links fill :open {hint-url}";  # Editar URL antes de abrir

          # -- Spawn externo --
          ",m" = "spawn mpv {url}";                           # Abrir video en mpv
          ",M" = "hint links spawn mpv {hint-url}";           # Seleccionar link y abrir en mpv
          ",g" = "spawn --detach ghostty";                    # Abrir terminal

          # -- Bitwarden --
          # Requiere: bitwarden-cli (bw) instalado
          # qute-bitwarden es un userscript que viene con qutebrowser
          # Llena usuario+password automaticamente para el dominio actual
          ",p" = "spawn --userscript qute-bitwarden";
          # Solo llenar password (util si el usuario ya esta puesto)
          ",P" = "spawn --userscript qute-bitwarden --password-only";
          # Solo llenar TOTP (codigo 2FA)
          ",t" = "spawn --userscript qute-bitwarden --totp-only";

          # -- Utilidades --
          ",r" = "spawn --userscript readability";            # Modo lectura limpia
          ",d" = "config-cycle colors.webpage.darkmode.enabled true false";  # Toggle dark mode

          # -- Session management --
          "ZZ" = "quit --save";                # Guardar sesion y salir (como Vim!)
        };

        insert = {
          # Ctrl-e abre el campo de texto en tu editor (nvim via ghostty)
          # Ya esta por defecto, pero lo hacemos explicito
          "<Ctrl-e>" = "edit-text";
        };
      };

      # ── Extra Config ───────────────────────────────────────────────────
      # Python crudo que se agrega al final de config.py
      # Util para cosas que Home Manager no soporta directamente
      extraConfig = ''
        # ── Per-domain settings ────────────────────────────────────────
        # config.pattern() permite configuracion por dominio
        # Ejemplo: deshabilitar JS en sitios especificos por seguridad/rendimiento
        #
        # with config.pattern("*://example.com/*") as p:
        #     p.content.javascript.enabled = False
        #     p.content.images = False

        # ── Aliases de comandos ────────────────────────────────────────
        # Comandos custom que puedes ejecutar con :alias
        c.aliases.update({
            "mpv": "spawn mpv {url}",
            "b": "spawn --userscript qute-bitwarden",
            "reader": "spawn --userscript readability",
        })
      '';
    };

    # ── Paquetes necesarios para userscripts ─────────────────────────────
    # bitwarden-cli es necesario para qute-bitwarden
    # rofi/dmenu son usados por qute-bitwarden para mostrar multiples matches
    home.packages = with pkgs; [
      bitwarden-cli
    ];
  };
}
