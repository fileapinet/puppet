class fileapi_ssh {
    if $::serverEnv == 'prod' {
        # To reduce the amount of spam in auth logs from automated SSH-attack bots, run prod's SSH
        # on a different port.
        $ports = [2224]
    } else {
        $ports = [22, 2224]
    }

    class { 'ssh::server':
        storeconfigs_enabled => false,
        options => {
            'PasswordAuthentication' => 'no',
            'PermitRootLogin'        => 'no',
            'Port'                   => $ports,
        },
    }
}
