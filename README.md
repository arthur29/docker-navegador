# Docker Firefox

### Xorg

To run xorg app from container  is necessary to execute to enable another hosts ip's to connect to xorg socket

`xhost +`

### Building

Build the image in the current directory

`docker build -t firefox .`

### Running

Then execute

`docker run --rm -d -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:rw -v ~/.Xauthority:/root/.Xauthority firefox`
