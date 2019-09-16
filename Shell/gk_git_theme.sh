alias notifyDone='terminal-notifier -title "Terminal" -message "Done with task!"'



#--------------GIT 
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}
function gig() {
  result=$(curl "http://www.gitignore.io/api/$1">/dev/null)

  if [[ $result =~ ERROR ]]; then
    echo "Query '$1' has no match. See a list of possible queries with 'gi list'"
  elif [[ $1 = list ]]; then
    echo "$result"
  else
    if [[ -f .gitignore ]]; then
      result=`echo "$result" | grep -v "# Created by http://www.gitignore.io"`
      echo ".gitignore already exists, appending"
      echo "$result" >> .gitignore
    else
      echo "$result" > .gitignore
    fi
  fi
}

#-------
# GIT Auto completion
#-------
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Git shortcuts

alias gr='git remote -v'

alias gs='git status'

alias gb='git branch'
alias gnn='git branch --no-merge'
alias gbm='git branch --merge'

alias go='git checkout'
alias ci='git commit -a -m'

alias gp='git pull origin'
alias gps='git push origin'

alias gpd='git pull origin develop'
alias gpsd='git push origin develop'

alias takemine='git checkout --ours'
alias taketheir='git checkout --theirs'

alias ours='git checkout --ours'
alias theis='git checkout --theirs'


alias apna='git checkout --ours'
alias uska='git checkout --theirs'

function pushpull() {
  branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
   if [[ $2 ]]; then
      remote=$2
    else
      remote="origin"
    fi
    echo ""
    echo "${BOLD}${MAGENTA}$1 ${RESET}branch: ${BOLD}${RED}$branch ${RESET}from ${BOLD}${RED}$remote${RESET} ↵"
    echo ""
    
    git "$1" "$remote" "$branch"
}

function cii(){
  message = ""
  if [[$@]] then
    message=$@
  else 
    message="No Message"
  fi
  git add .
  git commit -m "$message"
}

function pps(){
  pushpull "push" "$@"
}

function ppp(){
  pushpull "pull" "$@"
}




#-------
# Connected Device UDID
#-------

function getUDID {
  udid=($(system_profiler SPUSBDataType | grep -A 11 -w "iPad\|iPhone\|iPad" | grep "Serial Number" | awk '{ print $3 }'))
  if [ -z $udid ]; then
    echo "No device detected. Please ensure an iOS device is plugged in."
    exit 1
  else
    for i in "${udid[@]}"; do
    echo -n $i | pbcopy
    echo ""
    echo "${CYAN}UDID: ${BOLD}${YELLOW}$i"
    echo ""
    done
  fi
}

#-------
# Finder Commands
#-------

function mkcd(){
  echo "creating $@ ..."
  mkdir $@
  cd $@
}
function hh(){
  WORK_PATH="/Users/GauravKeshre/Workspace/HX/"
  echo "Opening $WORK_PATH ..."
  cd $WORK_PATH
}

function work(){
  # WORK_PATH="/Users/GauravKeshre/Workspace/Zoomcar/zc-ios-2.0/"
  WORK_PATH="/Users/gauravkeshre/Workspace/Microsoft/Teamspace-iOS"
  echo "Opening $WORK_PATH ..."
  cd $WORK_PATH
  ls
  git status
  find $WORK_PATH -maxdepth 1  -type d -name "*.xcworkspace" -print | xargs open -g
}
