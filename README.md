# Dev

docker image prune --force

distrobox rm nvim && docker build --pull -t ddddjent/nvim . && distrobox create --name nvim --image ddddjent/nvim --init-hooks "echo 'root:1' | chpasswd"

distrobox enter nvim

# Use

distrobox create --name nvim --image ddddjent/nvim --init-hooks "echo 'root:1' | chpasswd"

distrobox enter nvim

distrobox-export --bin /usr/local/bin/nvim --export-path ~/.local/bin
