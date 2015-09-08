class fileapi_nginx::files {
    fileapi_nginx::website { 'files':
        template => 'fileapi_nginx/files.conf.erb',
    }

    file { ['/home/fileapi/project/file-system']:
        ensure  => directory,
        owner   => 'fileapi',
        group   => 'fileapi',
        require => User['fileapi'],
    }
}
