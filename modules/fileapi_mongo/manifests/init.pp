class fileapi_mongo {
    user { 'mongodb':
        managehome => false,
        shell => '/sbin/nologin',
    }
    ~>
    file { ['/data',
            '/data/db']:
        ensure => directory,
        owner  => 'mongodb',
        group  => 'root',
        mode   => '0777',
    }
    ~>
    class {'::mongodb::globals':
        manage_package_repo => true,
    }
    ->
    class {'::mongodb::server':
        ensure  => true,
        verbose => false,
        auth    => false,
        bind_ip => ['127.0.0.1'],
        require => File['/data/db'],
    }
    ->
    class {'::mongodb::client':
    }
    ->
    # Tools like mongorestore and mongodump are not included with the MongoDB client package
    # in version 2.6 and up. They must be installed seperately.
    package {'mongodb-org-tools':
        ensure  => present,
    }

    mongodb_database { $::mongoDatabase:
        ensure  => present,
        require => Class['mongodb::server'],
    }
}
