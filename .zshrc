# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="flinnthebin"

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

# Rose-pine
# Directories to Pine (approximating #31748f)
# Symlinks to Foam (approximating #9ccfd8)
# .deb, .tar files to Iris (approximating #c4a7e7)

LS_COLORS='di=1;38;5;24:ln=1;38;5;117:*.deb=1;38;5;183:*.tar=1;38;5;183:*.tgz=1;38;5;183:*.arj=1;38;5;183:*.taz=1;38;5;183:*.lzh=1;38;5;183:*.lzma=1;38;5;183:*.tlz=1;38;5;183:*.txz=1;38;5;183:*.zip=1;38;5;183:*.z=1;38;5;183:*.Z=1;38;5;183:*.dz=1;38;5;183:*.gz=1;38;5;183:*.lz=1;38;5;183:*.xz=1;38;5;183:*.bz2=1;38;5;183:*.bz=1;38;5;183:*.tbz=1;38;5;183:*.tbz2=1;38;5;183:*.tz=1;38;5;183:*.deb=1;38;5;183:*.rpm=1;38;5;183:*.jar=1;38;5;183:*.war=1;38;5;183:*.ear=1;38;5;183:*.sar=1;38;5;183:*.rar=1;38;5;183:*.ace=1;38;5;183:*.zoo=1;38;5;183:*.cpio=1;38;5;183:*.7z=1;38;5;183:*.rz=1;38;5;183:*.cab=1;38;5;183:*.jpg=1;38;5;183:*.jpeg=1;38;5;183:*.gif=1;38;5;183:*.bmp=1;38;5;183:*.pbm=1;38;5;183:*.pgm=1;38;5;183:*.ppm=1;38;5;183:*.tga=1;38;5;183:*.xbm=1;38;5;183:*.xpm=1;38;5;183:*.tif=1;38;5;183:*.tiff=1;38;5;183:*.png=1;38;5;183:*.svg=1;38;5;183:*.svgz=1;38;5;183:*.mng=1;38;5;183:*.pcx=1;38;5;183:*.mov=1;38;5;183:*.mpg=1;38;5;183:*.mpeg=1;38;5;183:*.m2v=1;38;5;183:*.mkv=1;38;5;183:*.webm=1;38;5;183:*.ogm=1;38;5;183:*.mp4=1;38;5;183:*.m4v=1;38;5;183:*.mp4v=1;38;5;183:*.vob=1;38;5;183:*.qt=1;38;5;183:*.nuv=1;38;5;183:*.wmv=1;38;5;183:*.asf=1;38;5;183:*.rm=1;38;5;183:*.rmvb=1;38;5;183:*.flc=1;38;5;183:*.avi=1;38;5;183:*.fli=1;38;5;183:*.flv=1;38;5;183:*.gl=1;38;5;183:*.dl=1;38;5;183:*.xcf=1;38;5;183:*.xwd=1;38;5;183:*.yuv=1;38;5;183:*.cgm=1;38;5;183:*.emf=1;38;5;183:*.ogv=1;38;5;183:*.ogx=1;38;5;183:*.aac=1;38;5;183:*.au=1;38;5;183:*.flac=1;38;5;183:*.m4a=1;38;5;183:*.mid=1;38;5;183:*.midi=1;38;5;183:*.mka=1;38;5;183:*.mp3=1;38;5;183:*.mpc=1;38;5;183:*.ogg=1;38;5;183:*.ra=1;38;5;183:*.wav=1;38;5;183:*.axa=1;38;5;183:*.oga=1;38;5;183:*.spx=1;38;5;183:*.xspf=1;38;5;183:' ; export LS_COLORS

zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
autoload -Uz compinit
compinit

# Alias
alias python=python3
alias pip=pip3
alias vim=nvim
alias ssh="ssh -Y"
alias agent="eval $(ssh-agent -s)"
alias vol+='pactl set-sink-volume @DEFAULT_SINK@ +5%'
alias vol-='pactl set-sink-volume @DEFAULT_SINK@ -5%'

# PATH
prependPath() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$PATH:$1
    fi
}

appendPath() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$PATH:$1
    fi
}

appendPath "/opt/go/bin"

# BUILD
build() {
    mkdir -p build && \
    cd build && \
    cmake .. && \
    cmake --build . && \
    cd ..
}

unbuild() {
    rm -rf build
    echo "build directory removed"
}

echo $PWD && l

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
