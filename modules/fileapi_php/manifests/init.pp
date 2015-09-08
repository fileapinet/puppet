class fileapi_php {
    package { ['php5', 'php5-mongo', 'php5-gearman', 'php5-curl', 'php5-cli']:
        ensure => present,
        notify => Class['phpfpm::service'],
    }

    file { ['/etc/php5/fpm/php.ini', '/etc/php5/cli/php.ini']:
        ensure => present,
        source => 'puppet:///modules/fileapi_php/php.ini',
        require => [
            Package['php5-cli'],
            Package['php5-fpm'],
        ],
        notify => Class['phpfpm::service'],
        owner  => root,
        group  => root,
    }

    class { 'phpfpm':
        poold_purge => true,
        log_level   => 'warning',
        error_log   => '/var/log/php5-fpm.log',
    }

    fileapi_php::fpm_pool { 'api': }
}
