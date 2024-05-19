# time
function real_time() {
    local color="%{$(tput setaf 218)%}";  # color in PROMPT need format in %{XXX%} which is not same with echo
    local time="[$(date +%H:%M:%S)]";
    local color_reset="%{$(tput sgr0)%}";
    echo "${color}${time}${color_reset}";
}

# login_info
function login_info() {
    local color="%{$(tput setaf 183)%}";  # color in PROMPT need format in %{XXX%} which is not same with echo
    local ip="$(hostname -I | awk '{print $1}')";
    local color_reset="%{$(tput sgr0)%}";
    echo "${color}[%n@${ip}]${color_reset}";
}

# directory
function directory() {
    local color="%{$(tput setaf 152)%}";
    local directory="${PWD/#$HOME/~}";
    local color_reset="%{$(tput sgr0)%}";
    echo "${color}[${directory}]${color_reset}";
}

# git
ZSH_THEME_GIT_PROMPT_PREFIX="%{$(tput setaf 204)%}[";
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$(tput sgr0)%} ";
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$(tput setaf 223)%}%{$(tput setaf 204)%}]";
ZSH_THEME_GIT_PROMPT_CLEAN="%{$(tput setaf 204)%}]";

function update_git_status() {
    GIT_STATUS=$(_omz_git_prompt_info);
}

function git_status() {
    echo "${GIT_STATUS}"
}

# command
function update_command_status() {
    local arrow="";
    local color_reset="%{$(tput sgr0)%}";
    local reset_font="%{$(tput setaf 189)%}";
    COMMAND_RESULT=$1;
    export COMMAND_RESULT=$COMMAND_RESULT
    if $COMMAND_RESULT;
    then
        arrow="%{$(tput bold)$(tput setaf 204)%}❱%{$(tput bold)$(tput setaf 223)%}❱%{$(tput bold)$(tput setaf 31)%}❱";
    else
        arrow="%{$(tput bold)$(tput setaf 204)%}❱❱❱";
    fi
    COMMAND_STATUS="${arrow}${reset_font}${color_reset}";
}
update_command_status true;

function command_status() {
    echo "${COMMAND_STATUS}"
}

# output command execute after
output_command_execute_after() {
    if [ "$COMMAND_TIME_BEGIN" = "-20200325" ] || [ "$COMMAND_TIME_BEGIN" = "" ];
    then
        return 1;
    fi

    # cmd
    local cmd="$(fc -ln -1)";
    local color_cmd="";
    if $1;
    then
        color_cmd="$(tput setaf 31)";
    else
        color_cmd="$(tput bold)$(tput setaf 204)";
    fi
    local color_reset="$(tput sgr0)";
    cmd="${color_cmd}${cmd}${color_reset}"

    # time
    local time="[$(date +%H:%M:%S)]"
    local color_time="$(tput setaf 152)";
    time="${color_time}${time}${color_reset}";

    # cost
    local time_end="$(current_time_millis)";
    local cost=$(bc -l <<<"${time_end}-${COMMAND_TIME_BEGIN}");
    COMMAND_TIME_BEGIN="-20200325"
    local length_cost=${#cost};
    if [ "$length_cost" = "4" ];
    then
        cost="0${cost}"
    fi
    cost="[cost ${cost}s]"
    local color_cost="$(tput setaf 152)";
    cost="${color_cost}${cost}${color_reset}";

    echo -e "${time} ${cost} ${cmd}";
    echo -e "";
}

# command execute before
preexec() {
    COMMAND_TIME_BEGIN="$(current_time_millis)";
}

current_time_millis() {
    local time_millis;
    time_millis="$(date +%s.%3N)";
    echo $time_millis;
}

# command execute after
precmd() {
    # last_cmd
    local last_cmd_return_code=$?;
    local last_cmd_result=true;
    if [ "$last_cmd_return_code" = "0" ];
    then
        last_cmd_result=true;
    else
        last_cmd_result=false;
    fi

    # update_git_status
    update_git_status;

    # update_command_status
    update_command_status $last_cmd_result;

    # output command execute after
    output_command_execute_after $last_cmd_result;
}

# set option
setopt PROMPT_SUBST;

# timer
TMOUT=1;
TRAPALRM() {
    if [ "$WIDGET" = "" ] || [ "$WIDGET" = "accept-line" ] ; then
        zle reset-prompt;
    fi
}

# prompt
PROMPT='$(real_time) $(login_info) $(directory) $(git_status)$(command_status) ';
