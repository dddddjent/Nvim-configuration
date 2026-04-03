# ========================= Builder Stage =========================
FROM archlinux:latest AS builder

RUN pacman -Sy --noconfirm base-devel cmake ninja curl git

WORKDIR /neovim-src
RUN git clone --depth 1 --branch v0.12.0 https://github.com/neovim/neovim.git .
RUN make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=/opt/nvim install


# ========================= Final Stage =========================
FROM archlinux:latest

# deps
RUN pacman -Syu --noconfirm git ripgrep fd curl wget mise \
    lazygit tar gzip unzip cmake ninja gcc luarocks fzf \
    eslint-language-server vscode-html-languageserver \
    vscode-css-languageserver vscode-json-languageserver \
    tree-sitter-cli zathura zathura-pdf-poppler xdotool biber firefox texlive clang marksman zls && \
    pacman -Scc --noconfirm

ARG MISE_DATA_DIR="/usr/local/share/mise/data"
ARG MISE_CONFIG_DIR="/usr/local/share/mise/config"
ARG MISE_CACHE_DIR="/usr/local/share/mise/cache"
ARG MISE_STATE_DIR="/usr/local/share/mise/state"
ARG GARGO_HOME="/root/.cargo"
ARG RUSTUP_HOME="/root/.rustup"
ARG GOBIN="/usr/local/share/mise/data/installs"
ARG LOCAL_PATH="/usr/local/share/mise/data/installs/node/lts/bin:/usr/local/share/mise/data/installs/go/latest/bin:/usr/local/share/mise/data/installs/zig/latest/bin:/usr/local/share/mise/data/installs/python/latest/bin"

WORKDIR /tmp
RUN export PATH="$LOCAL_PATH:$PATH" && \
    mise use -g node@lts python@3.12 rust@stable zig@latest go@latest perl && \
    mise install lua-language-server@latest taplo@latest && \
    /root/.cargo/bin/rustup component add rust-analyzer rust-src && \
    /root/.cargo/bin/cargo install --git https://github.com/latex-lsp/texlab --locked --tag v5.25.1 && \
    pip install cmake-language-server "pygls>=1.1.1,<2.0.0" autopep8 debugpy && \
    pip cache purge && \
    go install golang.org/x/tools/gopls@latest && \
    go install github.com/hyprland-community/hyprls/cmd/hyprls@latest && \
    go install github.com/go-delve/delve/cmd/dlv@latest && \
    go clean -cache -modcache && \
    npm install -g \
        bash-language-server \
        eslint \
        dockerfile-language-server-nodejs \
        basedpyright \
        @fsouza/prettierd \
        yaml-language-server \
        @microsoft/compose-language-service \
        @vtsls/language-server && \
    npm cache clean --force && \
    rm -rf /usr/local/share/mise/cache && \
    rm -rf /root/.cache /root/.npm /root/.cargo/registry /root/.cargo/git /root/.rustup/tmp /root/.rustup/downloads /tmp/* && \
    pacman -Rns --noconfirm mise && \
    pacman -Scc --noconfirm

RUN wget -q -O /usr/local/share/mise/data/installs/latexindent https://github.com/cmhughes/latexindent.pl/releases/download/V4.0/latexindent-linux && \
    wget -q https://github.com/redhat-developer/vscode-xml/releases/download/0.29.0/lemminx-linux.zip && \
    unzip lemminx-linux.zip && \
    mv lemminx-linux /usr/local/share/mise/data/installs/lemminx && \
    wget -q -O codelldb.zip https://github.com/vadimcn/codelldb/releases/download/v1.12.1/codelldb-linux-x64.vsix && \
    unzip codelldb.zip -d codelldb && \
    mv codelldb /usr/local/share/mise/data/installs/ && \
    wget -q -O glsl_analyzer.zip https://github.com/nolanderc/glsl_analyzer/releases/download/v1.7.1/x86_64-linux-musl.zip && \
    unzip glsl_analyzer.zip && \
    mv ./bin/glsl_analyzer /usr/local/share/mise/data/installs && \
    rm -rf lemminx-linux.zip codelldb.zip glsl_analyzer.zip bin /tmp/* /root/.cache

# AI
ENV PATH=/root/.local/bin:$PATH
ENV PATH=/root/.opencode/bin:$PATH
RUN curl -fsSL https://opencode.ai/install | HOME=/root bash && \
    curl https://cursor.com/install -fsS | HOME=/root bash && \
    curl -fsSL https://gh.io/copilot-install | HOME=/root bash && \
    wget -q -O codex.tar.gz https://github.com/openai/codex/releases/download/rust-v0.118.0/codex-x86_64-unknown-linux-musl.tar.gz && \
    tar -xzf codex.tar.gz && \
    mv codex-x86_64-unknown-linux-musl /root/.local/bin/codex && \
    rm -rf codex.tar.gz /tmp/* /root/.cache

# nvim
COPY --from=builder /opt/nvim /opt/nvim
RUN /opt/nvim/bin/nvim --version

RUN echo '#!/bin/bash' > /usr/local/bin/nvim && \
    echo 'XDG_CONFIG_HOME=/etc/xdg/ XDG_DATA_HOME=/usr/local/share /opt/nvim/bin/nvim "$@"' >> /usr/local/bin/nvim && \
    chmod +x /usr/local/bin/nvim

RUN mkdir -p /etc/xdg && cd /etc/xdg && \
    git clone --depth 1 --single-branch https://github.com/dddddjent/Nvim-configuration.git nvim && \
    chmod -R 777 /etc/xdg/nvim

RUN /usr/local/bin/nvim --headless "+Lazy! restore" +qa && \
    rm -rf /root/.cache /tmp/*

# privilege setup
RUN mkdir -p /etc/xdg/lazygit /usr/local/share/nvim /usr/local/share/zathura && \
    chmod -R 777 /root /usr/local/share/mise /etc/xdg/lazygit /usr/local/share/nvim \
    /usr/local/share/zathura
