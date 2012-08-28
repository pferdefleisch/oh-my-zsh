c() { cd ~/Projects/$1;  }

_c() { _files -W ~/Projects -/; }
compdef _c c

# Rails perf increase https://gist.github.com/1688857
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

alias spk="bundle exec spork cucumber & bundle exec spork"
alias iphone="open /Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app"
alias sstr="sudo apachectl start"
alias sstp="sudo apachectl stop"
alias srt="sudo apachectl restart"
alias nstart="sudo nginx"
alias nstop="sudo nginx -s stop"
alias nreload="sudo nginx -s reload"
# alias cassandra="/usr/local/src/apache-cassandra-0.6.3/bin/cassandra-cli --host localhost --port 9160"
alias nstat="sudo lsof -i -P"
alias p="padrino"

. $HOME/.dotfiles/tools/z/z.sh
function precmd () {
  z --add "$(pwd -P)"
}
function github {
  open "https://github.com/search?q=$1&type=Everything&repo=&langOverride=&start_value=1"
}
function geo {
  geocode $1 | grep L
}

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
#alias ls='ls -GF'
#alias ll='ls -h1'
#alias lt='ls -lTsSa'
#alias lll='ls'
#alias lsl="ls -lG"
#alias lsla="ls -laG"
alias shortcuts="bind -P | less"

alias nodedoc="open /usr/local/src/nodejs_all/node-v0.3.0/doc/api.html"

alias v="vim ."
alias m="mvim ."
alias s.="open -a 'Sublime Text 2' ."
alias s="open -a 'Sublime Text 2'"
# Git tab completion
# source ~/.git-completion.bash
# Add paths that should have been there by default
export PATH=/usr/local/sbin:/usr/local/bin:${PATH}
export PATH="$HOME/bin:$PATH"
export PATH="$PATH:~/.gem/ruby/1.8/bin"

# Unbreak broken, non-colored terminal
export TERM='xterm-color'
alias duh='du -csh'
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"
alias b="bundle"
alias bi="bundle install --binstubs --without production"
alias bu="bundle update"
alias bc="bundle check"
alias be="bundle exec"
alias bo="bundle open"

alias migrate="bundle exec rake db:migrate"
alias dpl="bundle exec rake deploy"
alias easy_deploy="bundle exec rake vlad:easy_deploy"

alias nstart="sudo nginx"
alias nreload="sudo nginx -s reload"

# Unbreak history
export HISTSIZE=100000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

export WORDCHARS='*?[]~&;!$%^<>'

export ACK_COLOR_MATCH='red'

# ACTUAL CUSTOMIZATION OH NOES!
gd() { git diff $* | view -; }
gdc() { gd --cached $*; }
alias rbgrep="grep --include='*.rb' $*"
alias r="bundle exec rails"
alias rdbm="bundle exec rake db:migrate db:test:prepare"
alias rdbr="bundle exec rake db:rollback"
alias cpl="bundle exec rake assets:precompile"
alias clean="bundle exec rake assets:clean"
alias t="script/test $*"
alias sr="screen -r"
alias rr='rbenv rehash'
bindkey "^[[3~" delete-char
alias start='consular start'
alias edit='consular edit'
alias pryr="pry -r ./config/environment -r rails/console/app -r rails/console/helpers"
alias fs="bundle exec foreman start"
alias gemspeed='bundle exec ruby -e "$(curl -fsSL https://gist.github.com/raw/2588879/benchmark.rb)" | sort -n -k4'

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
alias i="identify"
