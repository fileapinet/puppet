define fileapi_users::user($groups = [], $home = "/home/${name}") {
    user { $name:
        ensure     => present,
        managehome => true,
        shell      => '/bin/bash',
        groups     => $groups,
    }

    file { $home:
        ensure  => directory,
        owner   => $name,
        group   => $name,
    }

    fileapi_bash::user_defaults { $name:
        home    => $home,
        require => User[$name],
    }
}
