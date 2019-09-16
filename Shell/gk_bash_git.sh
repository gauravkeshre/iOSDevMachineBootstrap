alias notifyDone='terminal-notifier -title "Terminal" -message "Done with task!"'


#-------
# GIT Auto completion
# run >> curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
#-------
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

function install-git-auto() {
  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
  chmod -X ~/.git-completion.bash
}

#-------
# GIT Shortcuts
#-------

alias gr='git remote -v'

alias gs='git status'

alias gb='git branch'
alias gnn='git branch --no-merge'
alias gbm='git branch --merge'

alias go='git checkout'
alias ci='git commit -a -m'
alias gf='git diff'

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

alias gar='git apply -R'
alias ga='git apply'
alias gp='git diff >'

alias gmd='git merge develop -m "synching with develop"'

function gss() {
  current_branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
  
  if [[ $@ ]]; then
    branch=$@
  else 
    branch="develop"
  fi
  echo "••• Checking out ${branch}"
  echo ""
  git checkout "$branch"
  ppp
  echo "••• Checking out ${current_branch}"
  echo ""
  go "$current_branch"

}

## Checks out to `develop` branch
## Pulls from `remote-develop` and updates develop branch
## Checks back out to intial branch and merges develop into it
function gsync() {
  current_branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
  if [[ $@ ]]; then
    branch=$@
  else 
    branch="develop"
  fi
  echo "••• Checking out ${branch}"
  echo ""
  git checkout "$branch"

  echo "••• Pulling from origin into ${branch}"
  echo ""
  ppp

  echo "••• Switching back to  ${current_branch}"
  echo ""
  go "$current_branch"

  echo "••• Merging ${branch} into ${current_branch}"
  echo ""
  git merge "$branch" -m "synching with $branch"
}

function push_or_pull() {
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

#-------
# Short-hand for `git push <remote> <branch>` 
# - Defaults remote to `origin`
# - Always pushes to current branch
#-------
function pps(){
  push_or_pull "push" "$@"
}

#-------
# Short-hand for `git pull <remote> <branch>` 
# - Defaults remote to `origin`
# - Always pulls current branch
#-------
function ppp(){
  push_or_pull "pull" "$@"
}



#-------
# Short-hand for `git commit` 
# - Optinally, you can pass a parameter
# - Perfoms `git add .` before commiting
# - Doesn't push.
#-------
function cii(){
  if [[ $@ ]]; then
    msg=$@
  else 
    msg="No Message"
  fi
  git add .
  echo "$msg"
  echo ""
  echo "git commit -m ${msg} ↵"
  echo ""
  git commit -m "$msg"
}




#-------
# Wrapper over gitignore.io api to generate gitignore file for new projects 
#-------
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
