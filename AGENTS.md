AGENT QUICK REFERENCE (dotfiles-refactor)
1. Build/Test: This repo is dotfiles; no compile step. Primary validation = apply chezmoi and ensure shell tools install. Run install script: ./setup. One-off package sync: chezmoi apply. Regenerate external tools: ~/.local/bin/mise install (after trust). Single tool test: command -v <tool> (e.g., command -v neovim).
2. Lint/Format: Shell scripts: use shellcheck (shellcheck <file>). Keep set -euo pipefail in scripts. Indent with 2 spaces, no trailing whitespace. POSIX sh unless zsh/bash features required; currently using bash.
3. Imports/Sourcing: Prefer explicit paths; guard with [ -f file ] before sourcing. Do not source large env altering scripts in non-interactive shells.
4. Types/Vars: For bash, use local vars inside functions. Use UPPER_SNAKE for exported env vars, lower_snake for locals. Quote all expansions: "${var}". Prefer $(...) over backticks.
5. Error Handling: Always set -euo pipefail at top of executable scripts. Check external commands with command -v before use. For optional steps, append || true with comment why.
6. Git/Branches: Keep commits minimal; no secrets. Commit regenerated binaries only if tracked (none here). Do not commit machine-specific artifacts.
7. Tools Managed via mise: Defined in dot_config/mise/config.toml. To add: edit file then run ~/.local/bin/mise install.
8. Chezmoi: Externals in .chezmoiexternals (e.g., mise binary). Scripts in .chezmoiscripts auto-run on change; replicate pattern when adding new scripts.
9. Prompt/Theming: Custom prompt in dot_bashrc; modify inside __bash_prompt function; preserve color codes and git status logic.
10. CI Emulation: To validate end-to-end: ./setup (fresh env) then chezmoi apply; ensure commands succeed with exit 0.
11. Security: Never curl | sh unvetted except existing chezmoi bootstrap line. Review URLs before changes.
12. PR Style: Title: area: concise change. Body: what/why + test notes. Avoid generic messages.
13. Extending: Add new tool -> update mise config + optionally alias in bashrc; keep alias lines grouped.
14. Testing Changes: After editing prompt or scripts: open new shell; verify PS1, run command -v for each tool, run lazygit to confirm install.
15. Shellcheck Waivers: Use # shellcheck disable=SCXXXX inline only with justification.
16. Performance: Avoid subshells in prompt; minimize git calls (already optimized with --no-optional-locks).
17. Compatibility: Stick to bash features present in Debian stable.
18. File Naming: Scripts executable, no extension or .sh; config files lower_snake.
19. Line Endings: Always LF; UTF-8 encoding.
20. Do not introduce AGENT automation files without updating this guide.
