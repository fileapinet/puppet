class fileapi_developers {
    group { 'developers':
        ensure => present,
    }

    fileapi_developers::application_user { 'fileapi': }
    fileapi_developers::developer { 'amy.boyd': }

    include fileapi_developers::sudo_rights
}
