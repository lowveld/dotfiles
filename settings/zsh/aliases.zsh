# General
alias portforward="ssh -X contactive@local.contactive.com -N  -R *:18888:127.0.0.1:18888 -v&"
alias ls="ls -G"
alias l="ls -l"
alias ll="ls -lAF"
alias la="ls -la"
alias ltr="ls -ltr"
alias latr="ls -latr"
alias ..="cd .."
alias ...="cd ../.."
alias md="mkdir"
alias meld="ksdiff"
export PATH=$PATH:/Users/teixeira/bin

# Plugins
source ~/.dotfiles/plugins/haste/haste.plugin.zsh
alias vboxctl='~/.dotfiles/plugins/virtualbox/vbctl-v1.9.sh'
alias dk='source ~/.dotfiles/plugins/docker/dockerstart.sh'
alias drm='~/.dotfiles/plugins/docker/docker-rm.sh'

# https://github.com/Nix-wie-weg/zsh-functions-and-aliases
browse() { open $(eval ${1}) }
alias branch_current='git rev-parse --abbrev-ref HEAD'
alias branch_oldest_ancestor='/usr/bin/diff -u <(git rev-list --first-parent master) <(git rev-list --first-parent HEAD) | sed -ne "s/^ //p" | head -1'
alias branch_log='git log $(branch_oldest_ancestor)..HEAD'
alias branch_diff='git diff $(branch_oldest_ancestor)..HEAD'
alias branch_files='git diff $(branch_oldest_ancestor)..HEAD --diff-filter=ACMR --name-only --oneline'
alias bitbucket_repo_url='echo https://$(git remote -v | grep -oh "bitbucket.org[:/][^ ]\+.git" | head -1 | sed "s/:/\//" | sed "s/\.git$//")'
alias bitbucket_review_url='echo $(bitbucket_repo_url)/branches/compare/$(branch_current)..$(branch_oldest_ancestor)'
alias redmine_url='echo http://redmine.nwwo.de/issues/$(branch_current | grep -oh "^[0-9]\+")'
alias branch_rubocop="branch_files | grep '\.rb$' | xargs rubocop"
