alias spk="bundle exec spork cucumber & bundle exec spork"
alias iphone="open /Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app"
alias sstr="sudo apachectl start"
alias sstp="sudo apachectl stop"
alias srt="sudo apachectl restart"
alias nstart="sudo nginx"
alias nstop="sudo nginx -s stop"
alias nreload="sudo nginx -s reload"
alias nstat="sudo lsof -i -P"

# Vagrant
alias vu='vagrant up'
alias vun='vagrant up --no-provision'
alias vr='vagrant reload'
alias vrn='vagrant reload --no-provision'
alias vh='vagrant halt'
alias vs='vagrant suspend'
alias vssh='vagrant ssh'

# Capistrano
alias deploy='cap deploy'

# Ruby Apps
alias prodlog="tail -n 300 -f log/production.log"

# OH-MY-ZSH
alias ohmy="vim ~/.oh-my-zsh/custom/plugins/pferdefleisch/pferdefleisch.plugin.zsh"

alias t="terminitor"
alias phpdoc="thor php:open"

alias powstop="curl get.pow.cx/uninstall.sh | sh"
alias powstart="curl get.pow.cx | sh"

alias g="git"
alias ports="sudo lsof -i -P"
export EDITOR="vim"
## terminal color fun
export CLICOLOR=1
#export LSCOLORS=caFxCxDxBxegedabagacad
alias ll='ls -h1'
alias lt='ls -lTsSa'
alias lll='ls'
alias lsl="ls -lG"
alias lsla="ls -laG"
alias shortcuts="bind -P | less"

alias nodedoc="open /usr/local/src/nodejs_all/node-v0.3.0/doc/api.html"

alias v="vim ."
alias m="mvim ."
alias s.="open -a 'Sublime Text 2' ."
alias s="open -a 'Sublime Text 2'"
alias duh='du -csh'
alias b="bundle"
alias bi="bundle install --binstubs --without production"
alias bu="bundle update"
alias bc="bundle check"
alias be="bundle exec"
alias bo="bundle open"

alias migrate="bundle exec rake db:migrate"
alias dpl="bundle exec rake deploy"
alias easy_deploy="bundle exec rake vlad:easy_deploy"

alias nsta="sudo nginx"
alias nsto="sudo nginx -s stop"
alias nres="sudo nginx -s reload"
alias ntest="sudo nginx -t $*"

alias rbgrep="grep --include='*.rb' $*"
alias r="bundle exec rails"
alias rdbm="bundle exec rake db:migrate db:test:prepare"
alias rdbr="bundle exec rake db:rollback"

alias uni="bundle exec unicorn -p 3000"

alias rr='rbenv rehash'

alias cpl="bundle exec rake assets:precompile"
alias clean="bundle exec rake assets:clean"

alias sr="screen -r"

alias t="tmux"

alias start='consular start'
alias edit='consular edit'
alias pryr="pry -r ./config/environment -r rails/console/app -r rails/console/helpers"
alias fs="bundle exec foreman start"
alias gemspeed='bundle exec ruby -e "$(curl -fsSL https://gist.github.com/raw/2588879/benchmark.rb)" | sort -n -k4'
alias i="identify"

# Handy Functions
c() { cd ~/Projects/$1;  }

_c() { _files -W ~/Projects -/; }
compdef _c c

# Z
. $HOME/.dotfiles/tools/z/z.sh
function precmd () {
  z --add "$(pwd -P)"
}

function ghsearch {
  open "https://github.com/search?q=$1&type=Everything&repo=&langOverride=&start_value=1"
}
function geo {
  geocode $1 | grep L
}

# Get ActiveRecord table columns for model
function model {
  cat db/schema.rb | grep "create_table \"$1s\"" -A 1000 | \
    while read line; do
      if [ -z "$line" ]
      then
        break
      elif [[ "$line" = "end" || "$line" =~ "create_table" ]]
      then continue
      else
        echo $line
      fi
    done
}

# ACTUAL CUSTOMIZATION OH NOES!
gd() { git diff $* | view -; }
gdc() { gd --cached $*; }
bindkey "^[[3~" delete-char

function routes() {
  if [ -n "$1" ]; then
    bundle exec rake routes | grep $1
  else
    bundle exec rake routes
  fi
}

function cdf() { cd *$1*/ } # stolen from @topfunky
# Originally from Jonathan Penn, with modifications by Gary Bernhardt
function whodoneit() {
    (set -e &&
        for x in $(git grep -I --name-only $1); do
            git blame -f -- $x | grep $1;
        done
    )
}

# Git tab completion
# source ~/.git-completion.bash

# Unbreak broken, non-colored terminal
export TERM='xterm-color'
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"

# Unbreak history
export HISTSIZE=100000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

export WORDCHARS='*?[]~&;!$%^<>'
export ACK_COLOR_MATCH='red'
# Rails perf increase https://gist.github.com/1688857
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000
