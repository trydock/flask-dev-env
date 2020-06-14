#!/bin/sh

if [ ! -d "/data/htdocs/local_docker_python_node/venv" ]
then
    echo "Python3 Virtual Environment does not Exists"
    # We need to create Python3 Virtual Environment.
    # In that case we will require installing 2 alpine packages
    apk update
    apk add gcc g++ linux-headers
    # Creating the Python3 Virtual Environment.
    python -m venv /data/htdocs/local_docker_python_node/venv
    # Installing the Python Flask and uWSGI modules
    pip install Flask uWSGI
    echo "Done Setting up Python3 Virtual Environment."
fi

cd /data/
source ./htdocs/local_docker_python_node/venv/bin/activate
uwsgi --ini uwsgi.ini
