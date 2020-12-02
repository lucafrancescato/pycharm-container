# Simple Docker container for super lightweight desktop environment

Based on ubuntu:20.04

Meant to be used as a side-car container

## Startup
Build image:

`docker build . --tag pycharm`

Run image:

`docker run -it --rm -v ~/random-dir/:/tmp/.X11-unix -v /path/to/projects/folder/:/home/crownlabs/PycharmProjects/pythonProject --net container:novnc --name pycharm pycharm`

Or run image with a different project root path (make sure PROJECT_DIR is set to this new path):

`docker run -it --rm -v ~/random-dir/:/tmp/.X11-unix -v /path/to/projects/folder/:/path/to/project/root/ --env PROJECT_DIR=/path/to/project/root/ --net container:novnc --name pycharm pycharm`