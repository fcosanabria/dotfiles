{ config, pkgs, ... }:

{
  home-manager.users.fsanabria = {
    home.file."Notes/.zk/config.toml".text = ''
      # zk configuration file

      [notebook]
      dir="~/Notes"

      [note]
      # if not an absolute path, it is relative to .zk/templates
      template = "default.md
      language = "en"
      default-title = "Untitled"
      filename = "{{title}}-{{id}}"
      extention = "md"
      id-charset = "hex"
      id-length = 3
      id-case = "lower"

      [extra]
      author = "Francisco"

      [group.journal]
      paths = ["journal/weekly", "journal/daily"]
 
      [group.journal.note]
      filename = "{{format-date now}}"
      template = "journal.md"

      [format.markdown]
      link-format = "wiki"
      hashtags = true

      [tool]
      editor = "nvim"
      shell = "/bin/fish"
      fzf-preview = "bat -p --color always {-1}"

      [lsp]

      [lsp.diagnostics]
      dead-link = "error"
      # Report titles of wiki-links as hints.
      wiki-title = "hint"
      # Warn for dead links between notes.
      dead-link = "error"
      # Warn when notes link here without backlinks.
      missing-backlink = { level = "warning", position = "bottom" }

      [lsp.completion]

      [filter]

      [alias]
      # Edit the last modified note.
      edlast = "zk edit --limit 1 --sort modified- $@"

      # Edit the notes selected interactively among the notes created the last two weeks.
      recent = "zk edit --sort created- --created-after 'last two weeks' --interactive"

      # Show a random note.
      lucky = "zk list --quiet --format full --sort random --limit 1" 
    '';
  };
}
