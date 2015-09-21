class fileapi_backend::python {
    # PIL is required for skin-color-detector.
    # libjpeg-dev and libpng-dev must be installed before installing PIL.

    package { ['python-pip', 'python-dev', 'libpng12-dev', 'libjpeg-dev']:
        ensure => present,
    }

    exec { 'Install PIL':
        command  => 'pip install --allow-external=PIL --allow-unverified=PIL PIL',
        user     => 'root',
        unless   => 'pip list | grep PIL',
        require  => [
            Package['python-pip'],
            Package['python-dev'],
            Package['libjpeg-dev'],
            Package['libpng12-dev'],
        ],
    }
}
