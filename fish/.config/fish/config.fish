# Thanks, I know you're friendly
set fish_greeting

set PATHS ~/.rbenv/bin ~/.gem/ruby/2.3.0/bin ~/.gem/ruby/2.1.0/bin ~/go/bin ~/.linuxbrew/bin /home/linuxbrew/.linuxbrew/bin
for path in $PATHS
    test -d $path ; and set -gx PATH $path $PATH
end

# activate virtualfish
which virtualfish 2>&1 > /dev/null; and eval (python -m virtualfish compat_aliases auto_activation)

# rbenv
if which rbenv 2>&1 > /dev/null
    status --is-interactive; and source (rbenv init -|psub)
end

# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
test -f $OMF_PATH/init.fish; and source $OMF_PATH/init.fish

# Private keys and such
test -f $HOME/.config/fish/private.fish; and source $HOME/.config/fish/private.fish

# fish ends up with some weird default that means man can't find anything
# unsetting this makes man use its defaults, which works
set -e MANPATH

alias be="bundle exec"

which fundle 2>&1 > /dev/null; and fundle plugin 'tuvistavie/fish-ssh-agent'

test -f $HOME/.config/fish/functions/gpg-agent.fish; and source $HOME/.config/fish/functions/gpg-agent.fish
