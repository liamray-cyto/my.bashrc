#!/bin/bash

alias less='less -I'
alias grep='grep -i --color'
alias tf='terraform'
alias tg='terragrunt'
alias c='clear'
alias h='history'
alias pp='python3'
alias gg='gcloud'
alias k='kubectl'
alias po=podman
alias ll='ls -la'
alias lll='find "$PWD" -maxdepth 1 -exec realpath {} \;'

PS1='[\u][$(pwd)]\$ '

mkdir -p '/home/coder/ws' '/home/coder/auth0'

untar() {
  tar -xzvf "${1}"
}

mkd() {
        if [[ ! -d "${1}" ]]
        then
                command mkdir -p "${1}"
        fi

        cd "${1}"
}

t64() {
        printf "${1}" | base64
}

f64() {
        printf "${1}" | base64 -d
        echo
}

sec() {
  kubectl get secret -n apps -o yaml "${1}" | less
}

git config --global user.email 'liam.ray@cytoreason.com'
git config --global user.name 'liam.ray'
git config --global core.editor "vim"

clone() {
        local url="${1}" dir="${2}"
        if [[ "${dir}" == "" ]]; then
          dir="$(basename "${url}" .git)"
        fi

        git clone "${url}" "${dir}" && cd "${dir}"
}

# activate service account
ggsa() {
  local sa_path="${1}"
  if [[ ! -z "${sa_path}" ]]
  then
    gcloud auth activate-service-account --key-file="${sa_path}"
  fi
}

dfdf() {
  diff <(cat "${1}") <(cat "${2}")
}

install_locate() {
  echo "Installing the locate utility"
  sudo apt install locate -y -qq

  echo "Updating files db"
  sudo updatedb
}

terragrunt_exec='/usr/local/bin/terragrunt'
if [[ ! -f "${terragrunt_exec}" ]]
then
        sudo wget 'https://github.com/gruntwork-io/terragrunt/releases/download/v0.71.2/terragrunt_linux_amd64' -O "${terragrunt_exec}"
        sudo chmod +x "${terragrunt_exec}"
fi
