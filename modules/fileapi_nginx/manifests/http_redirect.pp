class fileapi_nginx::http_redirect {
    fileapi_nginx::website { 'http_redirect':
        template => 'nginx/http_redirect.conf.erb',
    }
}
