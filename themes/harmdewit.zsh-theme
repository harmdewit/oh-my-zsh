ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[blue]%}git:(%{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[blue]%})%{$fg_bold[yellow]%} ✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[blue]%})"

function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo ' ('`basename $VIRTUAL_ENV`')'
}

function heroku_account {
  if $([ -d .git ] && (git remote -v show | grep -q git@heroku)) 
    then
      echo " $fg_bold[blue]%}h:$(git config heroku.account)"
  fi
}

PROMPT='%{$fg_bold[red]%}➜ %{$fg_bold[cyan]%}$(collapse_pwd)$(heroku_account)$(git_prompt_info)$(virtualenv_info)%{$reset_color%} '  

# Show '➜ username@device ...'
# PROMPT='%{$fg_bold[red]%}➜ %{$fg_bold[blue]%}%n@%m %{$fg_bold[cyan]%}$(collapse_pwd)$(git_prompt_info)$(virtualenv_info)%{$reset_color%} '
