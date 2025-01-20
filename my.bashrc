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

clone() {
        local url="${1}" dir="${2}"
        if [[ "${dir}" == "" ]]; then
          dir="$(basename "${url}" .git)"
        fi

        git clone "${url}" "${dir}" && cd "${dir}"
}


terragrunt_exec='/usr/local/bin/terragrunt'
if [[ ! -f "${terragrunt_exec}" ]]
then
        sudo wget 'https://github.com/gruntwork-io/terragrunt/releases/download/v0.71.2/terragrunt_linux_amd64' -O "${terragrunt_exec}"
        sudo chmod +x "${terragrunt_exec}"
fi

