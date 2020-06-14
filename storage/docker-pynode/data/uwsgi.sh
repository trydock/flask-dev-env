#!/bin/sh

#apk update
#apk add gcc g++ linux-headers

cd /data/
source ./htdocs/local_docker_python_node/venv/bin/activate
uwsgi --ini uwsgi.ini
