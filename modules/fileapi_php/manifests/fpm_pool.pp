define fileapi_php::fpm_pool($pm_max_requests = 50) {
    phpfpm::pool { $name:
        listen => "/var/run/php5-fpm-fileapi-${name}.sock",
        listen_allowed_clients => '127.0.0.1',
        user   => 'fileapi',
        group  => 'fileapi',
        listen_owner => 'www-data',
        listen_group => 'www-data',
        pm_max_requests => $pm_max_requests,
        notify => Service['nginx'],
    }
}
