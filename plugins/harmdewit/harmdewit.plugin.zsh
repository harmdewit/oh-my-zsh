# ==================================================================================================
# General Settings
# ==================================================================================================

# List all files colorized in long format
alias l="ls -Gl"

# List all files colorized in long format, including dot files
alias la="ls -Gla"

# File size
alias fs="stat -f \"%z bytes\""

# Enable aliases to be sudo’ed
alias sudo='sudo '

alias localserver="python -m SimpleHTTPServer"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"
alias fs="stat -f \"%z bytes\""

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
	alias "$method"="lwp-request -m '$method'"
done

eval "$(hub alias -s)"

# hub tab-completion script for zsh.
# This script complements the completion script that ships with git.
# Add git completion to hub
if declare -f _git_commands > /dev/null; then
  _hub_commands=(
    'alias:show shell instructions for wrapping git'
    'pull-request:open a pull request on GitHub'
    'fork:fork origin repo on GitHub'
    'create:create new repo on GitHub for the current project'
    'browse:browse the project on GitHub'
    'compare:open GitHub compare view'
  )
  # Extend the '_git_commands' function with hub commands
  eval "$(declare -f _git_commands | sed -e 's/base_commands=(/base_commands=(${_hub_commands} /')"
fi

# Autoload _git completion functions
if declare -f _git > /dev/null; then
  _git
fi

# Prettier git status
# alias git-status='git status -sb'
hub() { if [[ $@ == "status" ]]; then command hub status -sb; else command hub "$@"; fi; }


# Count commits
alias git-count='git shortlog -sn'

# Add all untracked changes
alias git-add-untracked='git add $(git ls-files -o --exclude-standard)'



# ==================================================================================================
# MacOSX Settings
# ==================================================================================================

# Get OS X Software Updates, update Homebrew itself, and upgrade installed Homebrew packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; gem update --system'

# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 10'"
alias hax="growlnotify -a 'Activity Monitor' 'System error' -m 'WTF R U DOIN'"

# ==================================================================================================
# Personal Settings
# ==================================================================================================

# Output this file
alias help='cat ~/.dotfiles/oh-my-zsh/plugins/harmdewit/harmdewit.plugin.zsh'
alias reload='source ~/.zshrc'

# Directory shortcuts
c() { cd ~/dropbox/code && $1 $2; }
_c() { _files -W ~/dropbox/code -/; }
compdef _c c

cc() { cd ~/dropbox/code/current && $1 $2; }
_cc() { _files -W ~/dropbox/code/current -/; }
compdef _cc cc

h() { cd ~/$1; }
_h() { _files -W ~/ -/; }
compdef _h h

conf() { cd ~/dropbox/configurations/$1; }
_conf() { _files -W ~/dropbox/configurations -/; }
compdef _conf conf

stud() { cd ~/dropbox/studie/$1; }
_stud() { _files -W ~/dropbox/studie -/; }
compdef _stud stud

