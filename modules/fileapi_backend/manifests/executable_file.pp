define fileapi_backend::executable_file() {
    file { $name:
        ensure  => file,
        mode    => '+x',
        require => [
            Class['fileapi_backend'],
        ],
    }
}
