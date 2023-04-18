grey='\e[0;90m'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$grey%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$grey%}) %{$fg[red]%}󰅙 %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$grey%}) %{$fg[green]%} %{$reset_color%}"

# current time with milliseconds
current_time() {
   echo "%*"
}

function josh_prompt {
  (( spare_width = ${COLUMNS} ))
  prompt=" "

  branch=$(git_current_branch)
  ruby_version=$(ruby_prompt_info)
  path_size=${#PWD}
  branch_size=${#branch}
  ruby_size=${#ruby_version}
  user_machine_size=18

  
  if [[ ${#branch} -ne 0 ]];
    then (( branch_size = branch_size + 5))
  fi
  
  (( spare_width = ${spare_width} - (${user_machine_size} + ${path_size} + ${branch_size} + ${ruby_size}) ))

  while [ ${#prompt} -lt $spare_width ]; do
    prompt=" $prompt"
  done
  
  prompt="%{%F{green}%}$PWD$prompt%{%F{red}%}$(ruby_prompt_info)%{$reset_color%} $(git_prompt_info)"
  
  echo $prompt
}

setopt prompt_subst

PROMPT='
Chen   $(josh_prompt) $(current_time)
%(?,%{%F{green}%},%{%F{red}%}) %{$reset_color%} '
