#!/bin/sh

echo "enter the http proxy server address"
read host

echo "enter the http proxy server port"
read port

readonly host
readonly port


# find *.h >> command.log 2>&1


echo 'Acquire::http::Proxy "http://'${host}':'${port}'";\nAcquire::https::Proxy "http://'${host}':'${port}'";' | tee -a /etc/apt/apt.conf
echo 'https_proxy = '${host}':'${port}\\n'http_proxy = '${host}':'${port} | tee -a /etc/wget
echo 'proxy=http://'${host}':'${port} | tee -a ~/.curlrc
echo 'export https_proxy="http://'${host}':'${port}'/"\nexport http_proxy="http://'${host}':'${port}'/"\nexport HTTPS_PROXY="http://'${host}':'${port}'/"\nexport HTTP_PROXY="http://'${host}':'${port}'/"' | tee -a ~/.zshrc
echo 'export https_proxy="http://'${host}':'${port}'/"\nexport http_proxy="http://'${host}':'${port}'/"\nexport HTTPS_PROXY="http://'${host}':'${port}'/"\nexport HTTP_PROXY="http://'${host}':'${port}'/"' | tee -a ~/.bashrc

mkdir /etc/systemd/system/docker.service.d
echo '[Service]\nEnvironment=HTTP_PROXY="http://'${host}':'${port}'/"\nEnvironment=HTTPS_PROXY="http://'${host}':'${port}'/"' | tee -a /etc/systemd/system/docker.service.d/http-proxy.conf

mkdir ~/.docker
echo '{\n  "proxies": {\n    "default": {\n      "httpProxy": "http://'${host}':'${port}'/",\n      "httpsProxy": "http://'${host}':'${port}'/",\n      "noProxy": "127.0.0.0/8"\n    }\n  }\n}' | tee -a ~/.docker/config.json


echo "finished"