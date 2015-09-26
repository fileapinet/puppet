class fileapi_nginx::site {
    fileapi_nginx::website { 'site':
        template => 'fileapi_nginx/site.conf.erb',
    }

    fileapi_nginx::website { 'www redirect':
        template => 'fileapi_nginx/www.conf.erb',
    }

    file { ['/home/fileapi/project/site',
            '/home/fileapi/project/site/current',
            ]:
        ensure  => directory,
        owner   => 'fileapi',
        group   => 'fileapi',
        require => File['/home/fileapi/project'],
    }
}
