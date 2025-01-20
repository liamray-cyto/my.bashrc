~~~

my_bash_rc_file='my.bashrc'
my_bash_rc="${HOME}/${my_bash_rc_file}"
bash_profile="${HOME}/.bash_profile"

if [[ ! -f "${bash_profile}" ]] || ! cat "${bash_profile}" | grep -q "${my_bash_rc_file}"
then
    wget 'https://raw.githubusercontent.com/liamray-cyto/my.bashrc/refs/heads/main/my.bashrc' -O "${my_bash_rc}"
    chmod +x "${my_bash_rc}"
    echo "source ${my_bash_rc}" >> "${bash_profile}"
    source "${my_bash_rc}"
fi

~~~