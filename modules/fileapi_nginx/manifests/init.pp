class fileapi_nginx {
    package { 'nginx':
        # As long as the Nginx development PPA is installed, we can just ensure => present instead
        # of specifying a version. We do need at least version 1.7.
        ensure => 'latest',
        require => Package['apache2'],
    }

    # Apache must be absent, because Apache tries to use port 80 which we want Nginx to use.
    package { ['apache2', 'apache2-bin', 'apache2-data']:
        ensure => absent,
    }

    file { '/etc/nginx/sites-enabled/default':
        ensure  => absent,
        require => [
            Package['nginx'],
        ],
        notify => [
            Service['nginx'],
        ]
    }

    file { '/etc/nginx/nginx.conf':
        ensure  => present,
        source  => 'puppet:///modules/fileapi_nginx/nginx.conf',
        owner   => root,
        group   => root,
        require => [
            Package['nginx'],
        ],
        notify  => [
            Service['nginx'],
        ]
    }

    service { 'nginx':
        ensure  => running,
        enable  => true,
        require => [
            Package['nginx'],
            Package['apache2'],
        ],
    }

    include fileapi_nginx::api
    include fileapi_nginx::files
    include fileapi_nginx::site
}
