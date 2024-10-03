### Rose Pine Moon Colors:
# Foreground (text):  #e0def4
# Background:         #232136
# Cyan (Pine):        #3e8fb0
# Yellow (Gold):      #f6c177
# Magenta (Iris):     #c4a7e7
# Red (Love):         #eb6f92
# Bright Cyan:        #9ccfd8
# Bright Yellow:      #f6c177

# Helper function for RGB ANSI sequences
rgb_color() {
    local R=$(echo $1 | cut -c2-3)
    local G=$(echo $1 | cut -c4-5)
    local B=$(echo $1 | cut -c6-7)
    echo -n "$(printf '\e[38;2;%d;%d;%dm' 0x$R 0x$G 0x$B)"
}

# time
function real_time() {
    local color="%{$(rgb_color '#f6c177')%}";  # Yellow (Gold)
    local time="[$(date +%H:%M:%S)]";
    local color_reset="%{$(tput sgr0)%}";
    echo "${color}${time}${color_reset}";
}

# login_info
function login_info() {
    local color="%{$(rgb_color '#9ccfd8')%}";  # Bright Cyan
    local ip="$(hostname -i | awk '{print $1}')";
    local color_reset="%{$(tput sgr0)%}";
    echo "${color}[%n@${ip}]${color_reset}";
}

# directory
function directory() {
    local color="%{$(rgb_color '#3e8fb0')%}";  # Cyan (Pine)
    local directory="${PWD/#$HOME/~}";
    local color_reset="%{$(tput sgr0)%}";
    echo "${color}[${directory}]${color_reset}";
}

# git
ZSH_THEME_GIT_PROMPT_PREFIX="%{$(rgb_color '#eb6f92')%}[";
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$(tput sgr0)%} ";
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$(rgb_color '#f6c177')%}%{$(rgb_color '#eb6f92')%} ]";
ZSH_THEME_GIT_PROMPT_CLEAN="%{$(rgb_color '#eb6f92')%}]";

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
    local reset_font="%{$(rgb_color '#e0def4')%}";  # Foreground (text)
    COMMAND_RESULT=$1;
    export COMMAND_RESULT=$COMMAND_RESULT
    if $COMMAND_RESULT;
    then
        arrow="%{$(tput bold)%}%{$(rgb_color '#eb6f92')%}❱%{$(tput bold)%}%{$(rgb_color '#f6c177')%}❱%{$(tput bold)%}%{$(rgb_color '#3e8fb0')%}❱";
    else
        arrow="%{$(tput bold)%}%{$(rgb_color '#eb6f92')%}❱❱❱";
    fi
    COMMAND_STATUS="${arrow}${reset_font}${color_reset}";
}
update_command_status true;

function command_status() {
    echo "${COMMAND_STATUS}"
}

# output command execute after
output_command_execute_after() {
    if [ "$COMMAND_TIME_BEGIN" = "-20200325" ] || [ "$COMMAND_TIME_BEGIN" = "" ]; then
        return 1;
    fi

    # cmd
    local cmd="$(fc -ln -1)";
    local color_cmd="";
    if $1; then
        color_cmd="$(rgb_color '#3e8fb0')";  # Cyan (Pine) for successful commands
    else
        color_cmd="$(tput bold)$(rgb_color '#eb6f92')";  # Red (Love) for failed commands
    fi
      local color_reset="$(tput sgr0)";
    cmd="${color_cmd}${cmd}${color_reset}"

    # time
    local time="[$(date +%H:%M:%S)]"
    local color_time="$(rgb_color '#f6c177')";  # Yellow (Gold)

    # cost
    local time_end="$(current_time_millis)";
    local cost=$(bc -l <<<"${time_end}-${COMMAND_TIME_BEGIN}");
    COMMAND_TIME_BEGIN="-20200325"
    local length_cost=${#cost};
    if [ "$length_cost" = "4" ]; then
        cost="0${cost}"
    fi
    cost="[cost ${cost}s]"
    local color_cost="$(rgb_color '#c4a7e7')";  # Magenta (Iris)

    # Display the executed command, time, and cost
    echo "${color_time}${time}${color_reset} ${color_cost}${cost}${color_reset} ${cmd}"
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
    if [ "$last_cmd_return_code" = "0" ]; then
        last_cmd_result=true;
    else
        last_cmd_result=false;
    fi

    # update_git_status
    update_git_status;

    # update_command_status
    update_command_status $last_cmd_result;

    # output_command_execute_after
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
