class fileapi_bash {
    file { '/etc/default/bash-fileapi-prompt.sh':
        ensure  => file,
        source  => 'puppet:///modules/fileapi_bash/prompt.sh',
        mode    => 'a+x',
    }
}
