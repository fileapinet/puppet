define fileapi_bash::user_defaults($home = "/home/${name}") {
    file { "bashrc_${name}":
        ensure  => present,
        path    => "${home}/.bashrc",
        require => User[$name],
    }

    file { "${home}/.profile":
        source  => 'puppet:///modules/fileapi_users/.profile',
        owner   => $name,
        group   => $name,
        require => User[$name],
    }

    file_line { "bash_defaults_${name}_prompt":
        path    => "${home}/.bashrc",
        line    => '. /etc/default/bash-fileapi-prompt.sh',
        require => [
            User[$name],
            File["${home}/.bashrc"],
        ]
    }
}
