class fileapi_users {
    fileapi_users::user { 'amy.boyd':
        groups => ['developers'],
    }

    fileapi_users::user { 'root':
        home => '/root',
    }

    fileapi_users::user { 'fileapi': }

    if $::serverEnv == 'dev' {
        fileapi_users::user { 'vagrant': }
    }
}
