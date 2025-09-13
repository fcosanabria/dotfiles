function setup_devcontainer_files
    # Get the current repository name
    set repo_name (basename (pwd))

    # Create scripts directory if it doesn't exist
    mkdir -p scripts

    # Create the setup script with dynamic repo name
    echo '#!/bin/bash

/usr/local/bin/mise trust /workspaces/'$repo_name'/mise.toml && /usr/local/bin/mise install' >scripts/setup

    # Make setup script executable
    chmod +x scripts/setup

    # Create mise.toml file
    echo '[tools]' >mise.toml

    echo "✅ Created scripts/setup and mise.toml for repository: $repo_name"
    echo "📁 Files created:"
    echo "   - scripts/setup (executable)"
    echo "   - mise.toml"
end
