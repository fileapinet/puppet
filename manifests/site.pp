Exec {
    path => '/bin:/usr/bin'
}

if $::fqdn =~ /.*\.prod$/ {
    $serverEnv = 'prod'
} elsif $::fqdn =~ /.*\.dev$/ {
    $serverEnv = 'dev'
} else {
    $serverEnv = 'dev'
}

$baseHost = $serverEnv ? {
    'prod' => 'fileapi.net',
    'dev' => 'fileapi.dev',
    default => 'fileapi.dev',
}

# Git is needed to deploy.
package { ['git']:
    ensure => present,
}

file { ['/home/fileapi/project',
        '/home/fileapi/logs', ]:
    ensure  => directory,
    owner   => 'fileapi',
    group   => 'fileapi',
    require => User['fileapi'],
}

node default {
    include fileapi_backend
    include fileapi_bash
    include fileapi_developers
    include fileapi_mongo
    include fileapi_nginx
    include fileapi_php
    include fileapi_ssh
    include fileapi_users
}
