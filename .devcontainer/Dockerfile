FROM fedora:latest

# Dependencies needed for mise tool builds
RUN dnf install -y \
    curl \
    git \
    unzip \
    gcc \
    gcc-c++ \
    make \
    sudo \
    && dnf clean all

# Create vscode user (devcontainers convention)
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=${USER_UID}
RUN groupadd --gid ${USER_GID} ${USERNAME} \
    && useradd --uid ${USER_UID} --gid ${USER_GID} -m ${USERNAME} \
    && echo "${USERNAME} ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/${USERNAME} \
    && chmod 0440 /etc/sudoers.d/${USERNAME}

# Install mise
COPY --from=jdxcode/mise /usr/local/bin/mise /usr/local/bin/

USER ${USERNAME}

# Activate mise in bash (will be overridden by chezmoi dotfiles)
RUN echo 'eval "$(mise activate bash)"' >> /home/${USERNAME}/.bashrc

ENV SHELL=/bin/bash
