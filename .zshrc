# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

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
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# Created by newuser for 5.9

export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000


# エイリアスが何を実行したかを表示する
show_cmd() {
    echo "=> $@"
    eval "$@"
}

# エイリアス
alias d='show_cmd docker'
alias dc='show_cmd docker compose'
alias dcx='show_cmd docker compose exec'
alias dcu='show_cmd show_cmd docker compose up'
alias dcd='show_cmd docker compose down'
alias dcr='show_cmd docker compose restart'
alias dp='show_cmd docker ps'
alias dcb='show_cmd docker compose build'
alias ds='show_cmd docker stop $(docker ps -aq)' # 全てのコンテナを停止
alias drm='show_cmd docker rm $(docker ps -aq)' # 全てのコンテナを削除
alias drmi='show_cmd docker rmi $(docker images -q)' # 全てのイメージを削除

alias railsc='show_cmd docker compose exec web rails c'
alias rspec='show_cmd docker compose exec web bundle exec rspec'
alias rubocop='show_cmd docker compose exec web bundle exec rubocop'

alias vi='nvim'

# AtCoder cli
# Test
alias cpptest='g++ main.cpp && oj t -d ./tests'                 # C++
alias pypytest='oj t -c "pypy3 main.py" -d ./tests'             # PyPy3
alias py3test='oj t -c "python3 main.py" -d ./tests'            # CPython
alias rbtest='oj t -c "ruby main.rb" -d ./tests'              # Ruby

# # Submit  ※現在使用不可
# alias cppsb='acc s main.cpp'                                    # C++
# alias pypysb='acc s main.py -- --guess-python-interpreter pypy' # PyPy3
# alias py3sb='acc s main.py'                                     # CPython
# alias rbsb='acc s main.rb'                                    # Ruby


alias _zshrc="show_cmd vi $HOME/.zshrc"

alias -g railskiso='58065_massan-E_basic_rails_basic'
alias -g railsouyou='57833_massan-E_runteq_curriculum_advanced'
alias -g railsnyuumon='58355_massan-E_beginner_rails'
alias -g sinatranyuumon='59341_massan-E_introduction_sinatra'

# OSの種類を判別
OS_TYPE=$(uname)

# 開発用ディレクトリのルートパスを定義
if [ "$OS_TYPE" = "Darwin" ]; then
    # macOSの場合のルートパス
    DEV_ROOT="/Users/massan" 
elif [ "$OS_TYPE" = "Linux" ]; then
    # Linux (WSL Ubuntu) の場合のルートパス
    DEV_ROOT="/mnt/d/masah"
fi


# プロジェクトのベースディレクトリを変数として定義
RUNTEQ_DIR="$DEV_ROOT/Development/Learning/RUNTEQ/Curriculum"

TIL_DIR="$DEV_ROOT/Development/Learning/til"

ALGORITHM_DIR="/mnt/d/masah/Programming/algorithm_devotion"

ANR_DIR="$DEV_ROOT/Development/Learning/RUNTEQ/anr_project"

MH_DIR="$DEV_ROOT/Development/Personal/MusicHour"

DOTFILES_DIR="$HOME/dotfiles"


# 汎用的なプロジェクト移動関数
goto_project() {
    local base_dir="$1"
    shift  # 最初の引数（ベースディレクトリが入った引数）を削除

    # 引数がない場合はベースディレクトリに移動
    if [ -z "$1" ]; then
        cd "$base_dir" && {
            echo "Moved to: ${base_dir}"
            return 0
        }
    fi

    if command -v "$1" >/dev/null 2>&1; then # command -v でコマンドが存在するか確認
        # 第1引数がコマンドの場合
        cd "$base_dir" && {
            echo "Moved to: ${base_dir}"
            echo "Execute command: $@" # $@ で全ての引数を取得
            eval "$@"
        }
    else
        # 第1引数がディレクトリの場合
        cd "$base_dir/$1" && {
            echo "Moved to: ${base_dir}/$1"
            if [ -n "$2" ]; then
                echo "Execute command: ${@:2}" # ${@:2} で2番目以降の引数を取得
                eval "${@:2}"
            fi
        }
    fi
}


# 各プロジェクト用のエイリアス
alias _runteq='goto_project "$RUNTEQ_DIR"'

alias _til='goto_project "$TIL_DIR"'

alias _al='goto_project "$ALGORITHM_DIR"'

alias _anr='goto_project "$ANR_DIR"'

alias _mh='goto_project "$MH_DIR"'

alias _dotfiles='goto_project "$DOTFILES_DIR"'


# カスタムエイリアス一覧表示関数
_alias() {
    echo -e "\nカスタムエイリアス一覧:"
    echo "----------------------"
    # Dockerコマンド関連
    echo -e "\nDocker関連:\n"
    alias | grep "show_cmd.* docker" | grep -v " rails\| rspec\| rubocop" | sed 's/show_cmd //'

    # Rails関連
    echo -e "\n\nRails関連:\n"
    alias | grep "show_cmd.*\( rails\| rspec\| rubocop\)" | sed 's/show_cmd //'

    # プロジェクト移動関連
    echo -e "\n\nプロジェクト移動:\n"
    alias | grep "goto_project" | while read -r line; do
        eval "echo \"${line}\""
    done

    # ファイル展開（VSCode）
    echo -e "\n\nファイル展開:\n"
    alias | grep "show_cmd.*code " | sed 's/show_cmd //'

    # その他のエイリアス
    echo -e "\n\nその他:\n"
    alias | grep "show_cmd" | grep -v " docker\| rails\| rspec\| rubocop\|goto_project\|code" | sed 's/show_cmd //'
    echo "railskiso='58065_massan-E_basic_rails_basic'"
    echo "railsouyou='57833_massan-E_runteq_curriculum_advanced'"
    echo "railsnyuumon='58355_massan-E_beginner_rails'"
    echo "sinatranyuumon='59341_massan-E_introduction_sinatra'"

    echo -e "\n----------------------\n"
}

til() {
    touch $1-$2-$3.md
    echo "# TIL for $1-$2-$3" > "$1-$2-$3.md"
    echo "Created TIL file: $1-$2-$3.md"
    vi $1-$2-$3.md
    echo "Opened TIL file in VSCode: $1-$2-$3.md"
}

# エイリアス設定用関数
# set_alias() {
#     echo "alias $1='$2'" >> ~/.zshrc
#     source ~/.zshrc
# }

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# windows wsl ubuntuのみ
if [ "$OS_TYPE" = "Linux" ]; then
  
  alias pdu='show_cmd pwd && wslpath -w "$(pwd)"'

  # stable-diffusion-webui-docker
  STABLE_DIFFUSION_DIR="/home/massanc/project/stable-diffusion-webui-docker"     
  alias _sd='goto_project "$STABLE_DIFFUSION_DIR"'
  alias _sdoutput='explorer.exe "$(wslpath -w /home/massanc/project/stable-diffusion-webui-docker/output)"'
  alias sdcu='/mnt/c/"Program Files"/Google/Chrome/Application/chrome.exe --incognito http://localhost:7860/ && show_cmd docker compose --profile auto up --build'

  # Created by `pipx` on 2025-06-10 00:52:33
  export PATH="$PATH:/home/massanc/.local/bin"
  
  # rbenv
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"

  # Direnv
  eval "$(direnv hook zsh)"


  # ローカルホストを開くための関数
  alias google-chrome='/mnt/c/"Program Files"/Google/Chrome/Application/chrome.exe'
  
  lh() {
    show_cmd "google-chrome http://localhost:$@ &>/dev/null &"
    return 0
  }
fi
