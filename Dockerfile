FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

# Install dependencies for fish (optional) and ensure locales
RUN apt-get update -y && apt-get install -y --no-install-recommends \
    curl ca-certificates fish git \
  && rm -rf /var/lib/apt/lists/*

# Adding Installing Mise (copy static binary)
COPY --from=jdxcode/mise /usr/local/bin/mise /usr/local/bin/

# Pre-create user config dirs (devcontainer user is vscode)
RUN mkdir -p /home/vscode/.config/fish \
  && chown -R vscode:vscode /home/vscode/.config

# Activate mise in bash, zsh, and fish for user vscode
RUN echo 'eval "$(mise activate bash)"' >> /home/vscode/.bashrc \
  && echo 'eval "$(mise activate zsh)"' >> /home/vscode/.zshrc \
  && printf '%s\n' '# Enable mise in fish' 'if command -v mise >/dev/null' '  mise activate fish | source' 'end' >> /home/vscode/.config/fish/config.fish \
  && chown vscode:vscode /home/vscode/.config/fish/config.fish

