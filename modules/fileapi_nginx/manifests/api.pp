class fileapi_nginx::api {
    fileapi_nginx::website { 'api':
        template => 'fileapi_nginx/api.conf.erb',
    }

    file { ['/home/fileapi/project/api',
            '/home/fileapi/project/api/current',
            '/home/fileapi/project/api/current/var',
            ]:
        ensure  => directory,
        owner   => 'fileapi',
        group   => 'fileapi',
        require => File['/home/fileapi/project'],
    }
}
