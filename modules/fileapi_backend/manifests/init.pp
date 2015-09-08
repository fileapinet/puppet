class fileapi_backend {
    include fileapi_backend::cron
    include fileapi_backend::gearman_workers
    include cron

    package { ['ffmpeg', 'pngquant', 'imagemagick', 'fontforge', 'clamav']:
        ensure => present,
    }

    class { 'gearman':
        ensure => present,
        listen => '127.0.0.1',
    }
}
