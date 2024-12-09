# pageDistanceBasedContourGenerator

Program that calculates the extraction polygon of present text lines given an existing baseline in the page file as per the article that can be found here [Distance Map Article](https://ieeexplore.ieee.org/document/8583787)

## Installation

This fork's aim is to provide a dockerized version of the software, since all 
its dependencies are outdated and difficult to obtain. (You need to have docker engine installed on your local machine to run a docker container)

The container built is based on the image available [here](https://github.com/agmangas/docker-opencv) which in turn is based on an ubuntu:16.04 LTS image.

After building original author's image you just have ubuntu with opencv dev libraries. You then have to install the remaining 
**_PRHLT/pageDistanceBasedContourGenerator_** dependencies before building and compiling the software itself.

To do so you can just copy paste the following commands.

Build original author's image
```bash
git clone https://github.com/agmangas/docker-opencv
cd docker-opencv
docker build ./
```
To work with ease we're going to tag this image (**docker_desktop>images** and copy the ID of the image you just built)
```bash
docker image tag <image-id-here> ContourTest
```
Create a container named **UbuntuOCV** based on the built image for the first time
```bash
docker run -t -i --name UbuntuOCV ContourTest bash
```
Every time you need to stop the container just use the command **exit** from the container's bash shell.

When you need to start the container and enter its bash shell
```bash
docker start UbuntuOCV
docker attach UbuntuOCV
```
Once you have this basic container running, you can run [this](./deps-and-compile.sh) script to install the dependencies and the software itself.
```bash
docker cp ./deps-and-compile.sh UbuntuOCV:/root
docker attach UbuntuOCV
```
in containers bash shell:
```bash
cd /root
./deps-and-compile.sh
```
Now you shoul have a binary file named **extract_lines** in the directory **_/root/pageDistanceBasedContourGenerator_**

### Versions

The tested versions of each library in dependencies:

```
liblog4cxx-dev:
  Installed: 0.10.0-10ubuntu1
  Candidate: 0.10.0-10ubuntu1
  Version table:
 *** 0.10.0-10ubuntu1 500
        500 http://archive.ubuntu.com/ubuntu xenial/universe amd64 Packages
        100 /var/lib/dpkg/status

libboost-all-dev:
  Installed: 1.58.0.1ubuntu1
  Candidate: 1.58.0.1ubuntu1
  Version table:
 *** 1.58.0.1ubuntu1 500
        500 http://archive.ubuntu.com/ubuntu xenial/universe amd64 Packages
        100 /var/lib/dpkg/status

eigen3:
    3.2
    https://gitlab.com/libeigen/eigen.git
    Commit SHA : ed5cd0a4d16e12daa1bef608628c103e67969d63

opencv:
    2.4.13.4
    pre-installed in container at : https://github.com/agmangas/docker-opencv
```

## Use of the software

1. The software provides a console parameter menu whith the following command:
```
extract_lines --help
```
2. The software can be run on the provided sample images with the following example command:
```
./extract_lines -i 156730303.jpg -p 156730303.xml -o output.xml -w 4 -x -1  
```

---

## Author
* Vicente Bosch Campos
