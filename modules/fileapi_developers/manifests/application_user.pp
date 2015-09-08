define fileapi_developers::application_user() {
    fileapi_users::user_with_ssh_dir { $name: }

    file { "/home/${name}/.ssh/authorized_keys":
        ensure  => file,
        owner   => $name,
        group   => $name,
        mode    => '0600',
        source  => "puppet:///modules/fileapi_developers/${name}.authorized_keys.txt",
        require => fileapi_users::user_with_ssh_dir[$name],
    }
}
