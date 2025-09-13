FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

# Adding Installing Mise
COPY --from=jdxcode/mise /usr/local/bin/mise /usr/local/bin/

# Install dependencies for fish (optional) and ensure locales
RUN apt-get update -y && apt-get install -y --no-install-recommends \
    curl ca-certificates fish git \
  && rm -rf /var/lib/apt/lists/*

# make sure mise is activated in bash, zsh, and fish. Might be overridden by a user's dotfiles.
RUN echo 'eval "$(mise activate bash)"' >> /home/vscode/.bashrc && \
    echo 'eval "$(mise activate zsh)"' >> /home/vscode/.zshrc && \
    echo 'mise activate fish | source' >> /home/vscode/.config/fish/config.fish
