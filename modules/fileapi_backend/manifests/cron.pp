class fileapi_backend::cron {
    $symfonyEnvironment = $::serverEnv ? {
        'prod' => 'prod',
        default => 'dev',
    }

    cron { 'send_swiftmailer_spool':
        command => "/home/fileapi/project/api/current/app/console swiftmailer:spool:send --env=${symfonyEnvironment}",
        user    => fileapi,
    }
}
