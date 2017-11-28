# Thanks, I know you're friendly
set fish_greeting

set -gx PATH ~/.rbenv/bin $PATH
set -gx PATH ~/.gem/ruby/2.3.0/bin $PATH
set -gx PATH ~/.gem/ruby/2.1.0/bin $PATH
set -gx PATH ~/go/bin $PATH
set -gx PATH ~/.linuxbrew/bin $PATH

# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

# rbenv
status --is-interactive; and source (rbenv init -|psub)

# activate virtualfish
eval (python -m virtualfish compat_aliases auto_activation)

# Private keys and such
source $HOME/.config/fish/private.fish

# fish ends up with some weird default that means man can't find anything
# unsetting this makes man use its defaults, which works
set -e MANPATH

alias be="bundle exec"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f $HOME/node_modules/tabtab/.completions/serverless.fish ]; and . $HOME/node_modules/tabtab/.completions/serverless.fish
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f $HOME/node_modules/tabtab/.completions/sls.fish ]; and . $HOME/node_modules/tabtab/.completions/sls.fish
fundle plugin 'tuvistavie/fish-ssh-agent'
source $HOME/.config/fish/functions/gpg-agent.fish
