abbr -a yr 'cal -y'

abbr -a c cargo
abbr -a ct 'cargo t'
abbr -a cr 'cargo r'

abbr -a e nvim
abbr -a vim nvim

abbr -a g git
abbr -a gc 'git checkout'
abbr -a gcb 'git checkout -b'
abbr -a ga 'git add -p'
abbr -a gcm 'git commit -m'
abbr -a vimdiff 'nvim -d'
abbr -a gah 'git stash; and git pull --rebase; and git stash pop'
abbr -a gits 'git status -s'

abbr -a t tmux
abbr -a ta 'tmux attach -t'
abbr -a tls 'tmux ls'
abbr -a tk 'tmux kill-session -t'

abbr -a wopen 'explorer.exe'


if command -v eza > /dev/null
	abbr -a l 'eza'
	abbr -a ls 'eza'
	abbr -a ll 'eza -l'
	abbr -a llg 'eza -l --git --git-ignore'
	abbr -a lll 'eza -la'
else
	abbr -a l 'ls'
	abbr -a ll 'ls -l'
	abbr -a lll 'ls -la'
end

setenv FZF_DEFAULT_COMMAND 'fd --type file --follow'
setenv FZF_CTRL_T_COMMAND 'fd --type file --follow'
setenv FZF_DEFAULT_OPTS '--height 20%'

# colored man output
# from http://linuxtidbits.wordpress.com/2009/03/23/less-colors-for-man-pages/
setenv LESS_TERMCAP_mb \e'[01;31m'       # begin blinking
setenv LESS_TERMCAP_md \e'[01;38;5;74m'  # begin bold
setenv LESS_TERMCAP_me \e'[0m'           # end mode
setenv LESS_TERMCAP_se \e'[0m'           # end standout-mode
setenv LESS_TERMCAP_so \e'[38;5;246m'    # begin standout-mode - info box
setenv LESS_TERMCAP_ue \e'[0m'           # end underline
setenv LESS_TERMCAP_us \e'[04;38;5;146m' # begin underline

function fish_user_key_bindings
	bind \cz 'fg>/dev/null ^/dev/null'
	if functions -q fzf_key_bindings
		fzf_key_bindings
	end
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    if ! set -q TMUX
	exec tmux
    end
end

if test -f ~/.autojump/share/autojump/autojump.fish;
    source ~/.autojump/share/autojump/autojump.fish;
end

