# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="rosepine"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

export BROWSER=firefox

# Rose-pine
# Directories to Pine (approximating #31748f)
# Symlinks to Foam (approximating #9ccfd8)
# .deb, .tar files to Iris (approximating #c4a7e7)

LS_COLORS='ex=1;38;5;152:di=1;38;5;24:ln=1;38;5;117:*.deb=1;38;5;218:*.tar=1;38;5;218:*.tgz=1;38;5;218:*.arj=1;38;5;218:*.taz=1;38;5;218:*.lzh=1;38;5;218:*.lzma=1;38;5;218:*.tlz=1;38;5;218:*.txz=1;38;5;218:*.zip=1;38;5;218:*.z=1;38;5;218:*.Z=1;38;5;218:*.dz=1;38;5;218:*.gz=1;38;5;218:*.lz=1;38;5;218:*.xz=1;38;5;218:*.bz2=1;38;5;218:*.bz=1;38;5;218:*.tbz=1;38;5;218:*.tbz2=1;38;5;218:*.tz=1;38;5;218:*.deb=1;38;5;218:*.rpm=1;38;5;218:*.jar=1;38;5;218:*.war=1;38;5;218:*.ear=1;38;5;218:*.sar=1;38;5;218:*.rar=1;38;5;218:*.ace=1;38;5;218:*.zoo=1;38;5;218:*.cpio=1;38;5;218:*.7z=1;38;5;218:*.rz=1;38;5;218:*.cab=1;38;5;218:*.jpg=1;38;5;183:*.jpeg=1;38;5;183:*.gif=1;38;5;183:*.bmp=1;38;5;183:*.pbm=1;38;5;183:*.pgm=1;38;5;183:*.ppm=1;38;5;183:*.tga=1;38;5;183:*.xbm=1;38;5;183:*.xpm=1;38;5;183:*.tif=1;38;5;183:*.tiff=1;38;5;183:*.png=1;38;5;183:*.svg=1;38;5;183:*.svgz=1;38;5;183:*.mng=1;38;5;183:*.pcx=1;38;5;183:*.mov=1;38;5;183:*.mpg=1;38;5;183:*.mpeg=1;38;5;183:*.m2v=1;38;5;183:*.mkv=1;38;5;183:*.webm=1;38;5;183:*.ogm=1;38;5;183:*.mp4=1;38;5;183:*.m4v=1;38;5;183:*.mp4v=1;38;5;183:*.vob=1;38;5;183:*.qt=1;38;5;183:*.nuv=1;38;5;183:*.wmv=1;38;5;183:*.asf=1;38;5;183:*.rm=1;38;5;183:*.rmvb=1;38;5;183:*.flc=1;38;5;183:*.avi=1;38;5;183:*.fli=1;38;5;183:*.flv=1;38;5;183:*.gl=1;38;5;183:*.dl=1;38;5;183:*.xcf=1;38;5;183:*.xwd=1;38;5;183:*.yuv=1;38;5;183:*.cgm=1;38;5;183:*.emf=1;38;5;183:*.ogv=1;38;5;183:*.ogx=1;38;5;183:*.aac=1;38;5;183:*.au=1;38;5;183:*.flac=1;38;5;183:*.m4a=1;38;5;183:*.mid=1;38;5;183:*.midi=1;38;5;183:*.mka=1;38;5;183:*.mp3=1;38;5;183:*.mpc=1;38;5;183:*.ogg=1;38;5;183:*.ra=1;38;5;183:*.wav=1;38;5;183:*.axa=1;38;5;183:*.oga=1;38;5;183:*.spx=1;38;5;183:*.xspf=1;38;5;183:'

# Autocomplete 
setopt histignorealldups sharehistory incappendhistory histignoredups histfindnodups

# Keep 5000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history

# Use modern completion system
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
autoload -Uz compinit
compinit

# Source history for autosuggestions
if [ -f /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
elif [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Alias
alias python="/home/archer/.python/bin/python3"
alias pip="/home/archer/.python/bin/pip3"
alias pyenv='source ~/.python/bin/activate'
alias vim=nvim ~/$(pwd | sed "s|$HOME/||")
alias ssh='ssh -Y'
alias vol+='pactl set-sink-volume @DEFAULT_SINK@ +5%'
alias vol-='pactl set-sink-volume @DEFAULT_SINK@ -5%'
alias format='find . \( -iname "*.h" -o -iname "*.cpp" -o -iname "*.hpp" \) | xargs clang-format -i'
alias get-headers="pacman -S $(pacman -Q | grep "^linux[0-9]* " | cut -d' ' -f1 | sed 's/$/-headers/')"
alias movewindow='function _movewindow() { i3-msg "[id=$1]" move container to workspace 󰕼; }; _movewindow'
alias hotreload='cd build && scp -r tradie flinnthebin:/var/www/ && cd .. && ssh flinnthebin'

pskill() {
  local keyword="$1"
  ps aux | grep "[${keyword:0:1}]${keyword:1}" | awk '{print $2}' | xargs kill
}


# PATH
prependPath() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$1:$PATH
    fi
}

appendPath() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$PATH:$1
    fi
}

prependPath "$HOME/.kotlin-language-server/src/main/kotlin/org/javacs/kt/semantictokens/SemanticTokens.kt"
prependPath "$HOME/.local/bin"
prependPath "$HOME/.ghcup/bin"
appendPath "$HOME/.cabal/bin/xmonad"
appendPath "/usr/share/platform-tools"
export CHROME_EXECUTABLE="/usr/bin/chromium"
export ANDROID_HOME="/opt/android-sdk"
export ANDROID_NDK_HOME="opt/android-ndk/"
export JAVA_HOME="/usr/lib/jvm/java-17-openjdk"
export GOROOT="/usr/local/go"
export GOPATH="$HOME/.go"
prependPath "$GOROOT/bin"
prependPath "$GOPATH/bin"
prependPath "$HOME/.local/flutter/bin"
appendPath "$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools"
appendPath "$JAVA_HOME/bin:$PATH"

# AGENT
function agent() {
    eval "$(ssh-agent -s)"
    if [ -d ~/.ssh/private/ ]; then
        echo "Select a key to add:"
        select key in ~/.ssh/private/*; do
            if [ -n "$key" ]; then
                ssh-add "$key"
                break
            else
                echo "Invalid selection. Please try again."
            fi
        done
    else
        echo "~/.ssh/private/ directory does not exist."
    fi
}

# GIT
function gap() {
    git add .
    git commit -m "$1"
    git push
}

# BUILD
build() {
    cmake -S . -B build && cmake --build build
}

unbuild() {
    rm -rf build
    echo "build directory removed"
}

wasm-build() {
    mkdir -p build-wasm && \
    emcmake cmake -S . -B build-wasm -DCMAKE_BUILD_TYPE=Release \
        -DUSE_EXTERNAL_GLFW=OFF \
        -DBUILD_EXAMPLES=OFF \
        -DBUILD_GAMES=OFF \
        -DPLATFORM=Web \
        -DGRAPHICS=GRAPHICS_API_OPENGL_ES2 && \
    cmake --build build-wasm
}

# CPPDOC
cppdoc() {
    local file
    file=$(find ~/.cppdoc/ -type f 2>/dev/null | fzf)
    [ -n "$file" ] && mdcat "$file"
}

# AUDIO
airpods() {
    pulseaudio -k
    pulseaudio --start
    bluetoothctl connect "B0:3F:64:21:7E:D7"
}

beats() {
    pulseaudio -k
    pulseaudio --start
    bluetoothctl connect "04:9D:05:E0:A5:0C"
}

unbeats() {
bluetoothctl disconnect "04:9D:05:E0:A5:0C"
}


# STREAM

miccheck() {
    arecord -vvv -f dat /dev/null
}

function stream() {
  echo -n "Enter password to decrypt stream key: "
  read -s password

  stream_key=$(echo "$password" | openssl enc -aes-256-cbc -d -in ~/.ssh/stream_key.enc -pass stdin)

  unset password

  ffmpeg \
    # xrandr
    -thread_queue_size 512 -f x11grab -s 1920x1080 -framerate 30 -i :0.0+0,0 \
    # v4l2-ctl --list-devices
    -thread_queue_size 512 -f v4l2 -s 240x180 -framerate 30 -i /dev/video0 \
    # arecord -l
    -thread_queue_size 512 -f alsa -ac 1 -ar 48000 -sample_fmt s16 -i default -af "highpass=f=200,agate=threshold=-30dB" \
    # 0.3 - colour similarity :0.3 - blend
    -filter_complex "[1:v]chromakey=0x00ff00:0.3:0.3[ckout];[0:v][ckout] overlay=W-w-10:H-h-10" \
    -c:v libx264 -preset veryfast -b:v 3000k -maxrate 3000k -bufsize 6000k \
    -c:a aac -b:a 160k \
    -probesize 10M \
    -f flv rtmp://live.twitch.tv/app/$stream_key

  unset stream_key
}

# antikris
antikris() {
    xrandr --output eDP --gamma 1:1:1 --brightness 1
}

[ -f "/home/archer/.ghcup/env" ] && . "/home/archer/.ghcup/env" # ghcup-env
. "$HOME/.cargo/env"

xrandr --output HDMI-1-0 --mode 1920x1080 --same-as eDP
