define fileapi_users::user_with_ssh_dir($home = "/home/${name}") {
    file { "${home}/.ssh":
        ensure  => directory,
        owner   => $name,
        group   => $name,
        require => fileapi_users::user[$name],
    }
}
