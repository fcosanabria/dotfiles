function setup_devcontainer_files
    # Get the current repository name
    set repo_name (basename (pwd))

    # Create directories if they don't exist
    mkdir -p scripts
    mkdir -p .devcontainer

    # Create the setup script with dynamic repo name
    echo '#!/bin/bash

/usr/local/bin/mise trust /workspaces/'$repo_name'/mise.toml && /usr/local/bin/mise install' >scripts/setup

    # Make setup script executable
    chmod +x scripts/setup

    # Create mise.toml file
    echo '[tools]' >mise.toml

    # Create devcontainer.json
    echo '{
  "build": {
    "context": "..",
    "dockerfile": "Dockerfile"
  },
  "postCreateCommand": "scripts/setup"
}' >.devcontainer/devcontainer.json

    # Create Dockerfile
    echo 'FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

# Adding Installing Mise
COPY --from=jdxcode/mise /usr/local/bin/mise /usr/local/bin/

# Install dependencies for fish (optional) and ensure locales
RUN apt-get update -y && apt-get install -y --no-install-recommends \
    curl ca-certificates fish git \
  && rm -rf /var/lib/apt/lists/*

# make sure mise is activated in bash, zsh, and fish. Might be overridden by a user'\''s dotfiles.
RUN echo '\''eval "$(mise activate bash)"'\'' >> /home/vscode/.bashrc && \
    echo '\''eval "$(mise activate zsh)"'\'' >> /home/vscode/.zshrc' >.devcontainer/Dockerfile

    echo "✅ Created devcontainer files for repository: $repo_name"
    echo "📁 Files created:"
    echo "   - scripts/setup (executable)"
    echo "   - mise.toml"
    echo "   - .devcontainer/devcontainer.json"
    echo "   - .devcontainer/Dockerfile"
end
