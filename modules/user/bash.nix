{ pkgs, ... }:

{
  # Bash (shell secundario; el principal es fish). Prompt con git.
  # Opciones nativas de NixOS (programs.bash), sin home-manager.
  programs.bash.interactiveShellInit = ''
    # Git prompt support
    source ${pkgs.git}/share/bash-completion/completions/git-prompt.sh

    PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'
    PS1='\[\e[96;1m\]\u\[\e[0m\]@\h in \W | ''${PS1_CMD1}\n\$ '
  '';
}
