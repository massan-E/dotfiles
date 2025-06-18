# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
source "/etc/profile.d/rvm.sh"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

export PATH="$HOME/.deno/bin:$PATH"

export RENDER_API_KEY=rnd_zz9789NYr2zkpL724E6Uh7TFnTCs
. "/home/massanc/.deno/env"

##############################################

# エイリアスが何を実行したかを表示する
show_cmd() {
    echo "=> $@"
    eval "$@"
}


# エイリアス
alias d='show_cmd docker'
alias dc='show_cmd docker compose'
alias dcx='show_cmd docker compose exec'
alias dcu='show_cmd docker compose up'
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

alias _bashrc='show_cmd code /home/massanc/.bashrc'
alias _zshrc='show_cmd code /home/massanc/.zshrc'


# プロジェクトのベースディレクトリを変数として定義
RUNTEQ_DIR="/mnt/d/masah/Programming/Runteq/Projects"


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


# カスタムエイリアス一覧表示関数
_alias() {
    echo -e "\nカスタムエイリアス一覧:"
    echo "----------------------"
    # Dockerコマンド関連
    echo -e "\nDocker関連:\n"
    alias | grep "docker" | sed 's/show_cmd //'

    # Rails関連
    echo -e "\n\nRails関連:\n"
    alias | grep "rails\|rspec\|rubocop" | sed 's/show_cmd //'

    # プロジェクト移動関連
    echo -e "\n\nプロジェクト移動:\n"
    alias | grep "goto_project" | while read -r line; do
        # 変数を展開し、goto_projectをcdに置換
        eval "echo \"${line}\""
    done

    # ファイル展開関連（VSCode）
    echo -e "\ファイル展開関連:\n"
    alias | grep "code" | sed 's/show_cmd //'
    echo -e "\n----------------------\n"
}

export PATH="~/.rbenv/bin:$PATH"
eval "$(~/.rbenv/bin/rbenv init -)"
