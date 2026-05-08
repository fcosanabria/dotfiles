FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

# Dependencies needed for mise tool builds
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    git \
    unzip \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install mise
COPY --from=jdxcode/mise /usr/local/bin/mise /usr/local/bin/

# Activate mise in bash for the vscode user (will be overridden by chezmoi dotfiles)
RUN echo 'eval "$(mise activate bash)"' >> /home/vscode/.bashrc

ENV SHELL=/bin/bash
