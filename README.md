~~~

my_bash_rc_file='my.bashrc'
my_bash_rc="${HOME}/${my_bash_rc_file}"
bash_profile="${HOME}/.bash_profile"
bash_rc="${HOME}/.bashrc"
my_scripts='https://raw.githubusercontent.com/liamray-cyto/my.bashrc/refs/heads/main/my.bashrc'

if [[ ! -f "${bash_profile}" ]] || ! grep -q "${my_bash_rc_file}" "${bash_profile}"
then
    wget "${my_scripts}" -O "${my_bash_rc}"
    chmod +x "${my_bash_rc}"
    echo "source ${my_bash_rc}" >> "${bash_profile}"
    echo "source ${my_bash_rc}" >> "${bash_rc}"
    source "${my_bash_rc}"
fi

~~~
