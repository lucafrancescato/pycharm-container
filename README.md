# Simple Docker container for super lightweight desktop environment

Based on ubuntu:20.04

## Startup
Build image:

`docker build . --tag pycharm`

Run image:

`docker run -it --rm -v ~/random-dir/:/tmp/.X11-unix -v /path/to/project/:/home/vncuser/PycharmProjects/pythonProject --net container:$(docker ps -aqf "name=novnc") --name pycharm pycharm`

Or run image with a different project directory path (make sure PROJECT_DIR is set to this new path):

`docker run -it --rm -v ~/random-dir/:/tmp/.X11-unix -v /path/to/project/:/home/vncuser/path/to/project/ --env PROJECT_DIR=/home/vncuser/path/to/project/ --net container:$(docker ps -aqf "name=novnc") --name pycharm pycharm`