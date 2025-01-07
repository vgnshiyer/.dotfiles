# ███████╗███████╗███████╗
# ██╔════╝╚══███╔╝██╔════╝
# █████╗    ███╔╝ █████╗
# ██╔══╝   ███╔╝  ██╔══╝
# ██║     ███████╗██║
# ╚═╝     ╚══════╝╚═╝
# 🌸 A command-line fuzzy finder
# https://github.com/junegunn/fzf

set -Ux FZF_DEFAULT_COMMAND "fd -H -E '.git'"
set -Ux FZF_DEFAULT_COMMAND "rg --files --hidden --no-ignore --glob '!.git'"


set -Ux FZF_DEFAULT_OPTS "\
--marker=' ' \
--no-info \
--no-separator \
--preview=\"cat {}\" \
--reverse"

set -Ux FZF_TMUX_OPTS "-p 55%,60%"

set -Ux FZF_CTRL_R_OPTS "\
--border-label=' history ' \
--prompt='  '"
