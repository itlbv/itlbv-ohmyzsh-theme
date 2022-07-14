# itlbv.zsh-theme
#
# Author: Artem Fokin
# URL: http://gihub.com/itlbv/

first_arrow() {
  echo "%B╭%b"
}

second_arrow() {
  echo "%B╰%b→"
}

directory() {
   echo "%{$FG[149]%}%~%{$reset_color%}"
}

git_info() {
	echo "%{$FG[131]%}$(git_prompt_info)%{$reset_color%}"
}

git_prompt_char_count() {
  echo ${#$(git_prompt_info)[1]}
}

# dashed separator size
# taken from af-magic theme, authored by Andy Fleming http://andyfleming.com/
function dashes {
  # check either virtualenv or condaenv variables
  local python_env="${VIRTUAL_ENV:-$CONDA_DEFAULT_ENV}"

  # if there is a python virtual environment and it is displayed in
  # the prompt, account for it when returning the number of dashes
  if [[ -n "$python_env" && "$PS1" = \(* ]]; then
    echo $(( COLUMNS - ${#python_env} - 5 ))
  else
    echo $(( COLUMNS - 3 ))
  fi
}

dashes_count() {
  echo $(($(dashes)-$(git_prompt_char_count)))
}

magic_dashes() {
  echo ${(l.($(dashes_count))..-.)}
}

PROMPT='$(first_arrow) $(git_info) $(magic_dashes)
$(second_arrow) $(directory) ' 

RPROMPT=''

# set the git_prompt_info text
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

