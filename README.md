# Docker Python Template

## Prerequisites

1. [For Windows users] To install Docker Desktop, you'll need Windows 10 Pro or Enterprise version 15063.
2. Install Docker

- [for Mac](https://docs.docker.com/docker-for-mac/install/)
- [for Linux](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
- [for Windows](https://docs.docker.com/docker-for-windows/install/)

- **Important things to note**:
  - You will be prompted to create a DockerHub account. Follow the instructions in order to download Docker
  - Follow the installation prompts (go with the default options) **until you have successfully started Docker**
  - [Windows users] When prompted to enable Hyper-V and Containers features, click 'Ok' and let computer restart again.
  - You may have to restart your computer 2-3 times.

3. Start Docker on your desktop (Note: Wait for Docker to complete startup before running the subsequent commands. You'll know when startup is completed when the docker icon in your taskbar stops animating)

## Setup

```sh
# build
docker build . -t my-project

# run container
docker run -it -v $(pwd):/code -p 8888:8888 my-project bash
# note: -p 8888:8888 maps port 8888 to your host machine and is needed for jupyter notebooks
# note: -v $(pwd):/code mounts your current working directory (presumably your project directory) and makes any changes instantly available in the running container

# run unit tests
nosetests

# run unit tests in watch mode and color output
nosetests --with-watch --rednose --nologcapture

```

If you want to run 2 long-lived commands/processes in the same container (e.g. run jupyter notebook and nosetests at the same time), you can start a second process in a running container by doing the following:

```sh
# see list of running containers
docker ps

# start a bash shell in a running container
docker exec -it <container-id> bash

# run the second command, for example, if you want to start a jupyter notebook:
jupyter notebook --ip 0.0.0.0 --no-browser --allow-root
```

## Configure your IDE

1. install dependencies on host (because your IDE can't use the dependencies inside the Docker container):
   `bin/install_deps_locally.sh`
1. tell your IDE the path to the Python virtual environment on your host
1. restart your IDE (you may have to give it a minute or 2)
1. start using intellisense!
