define fileapi_backend::gearman_worker() {
    $symfonyEnvironment = $::serverEnv ? {
        'prod' => 'prod',
        default => 'dev',
    }

    supervisor::service { $name:
        ensure      => present,
        command     => "/home/fileapi/project/api/current/bin/workers/start-one ${name} ${symfonyEnvironment}",
        redirect_stderr => true,
        stdout_logfile => "/home/fileapi/project/api/current/var/logs/${symfonyEnvironment}_supervisor_${name}.log",
        user        => 'fileapi',
        group       => 'fileapi',
        numprocs    => 1,
        autorestart => true,
        require     => [
            Class['fileapi_backend'],
            fileapi_users::user['fileapi'],
            fileapi_backend::executable_file['/home/fileapi/project/api/current/bin/workers/start-one'],
            fileapi_backend::executable_file['/home/fileapi/project/api/current/bin/workers/stop-all'],
        ],
    }
}
