<p align="center"><img width="250" height="250" src="https://github.com/jgphilpott/polymorph/blob/master/app/imgs/theme/logo.png"></p>

# Intro

Polymorph is a [JavaScript](https://en.wikipedia.org/wiki/JavaScript) based 3D modeling software that uses [three.js](https://github.com/mrdoob/three.js) and [csg.js](https://github.com/evanw/csg.js) in the background. It can export [STL](https://en.wikipedia.org/wiki/STL_(file_format)) and [OBJ](https://en.wikipedia.org/wiki/Wavefront_.obj_file) files to be used for 3D printing. The project also works in combination with a personal [Things](https://github.com/jgphilpott/things) repository that can be used to store your own models and designs without polluting the software.

# Setup

1) Clone this repository to you local device with the command `git clone https://github.com/jgphilpott/polymorph.git`.

2) Optionally create or clone a [Things](https://github.com/jgphilpott/things) repository in the same location with the command `mkdir things` or `git clone https://github.com/<USERNAME>/things.git`. You can also do this step later but you will need to rebuild your docker container.

3) Assuming you have [docker compose installed](https://docs.docker.com/compose/install), navigate into the Polymorph repository and run `docker-compose up --build`. The build will take some time but once it’s done you can view the application by visiting `localhost:4000` in a web browser. In future deployments you can simply use the command `docker-compose up`.

# Usage

To create/view a 3D model you will need to add a polygen function to one of the root files in the [scripts directory](https://github.com/jgphilpott/polymorph/tree/master/app/scripts). You can either create a new function from scratch or copy and paste from one of the [Things](https://github.com/jgphilpott/things).

Once you see the desired model in the view you can use `Ctrl + Enter` to download it as an STL file or `Shift + Enter` to download it as an OBJ file. You can use any software you like to slice the STL/OBJ files but [Cura](https://github.com/Ultimaker/Cura) is recommended.

If you have any problems with the software or an idea for a new feature please [open an issue](https://github.com/jgphilpott/polymorph/issues), thanks!

# Connect & Share

**I'd love to see all the things you create with Polymorph so please connect and share!** [I](https://github.com/jgphilpott) have used this software for all of my personal 3D models, you can view and download my creations on several different websites listed here:

### <img align="left" width="25" height="25" src="https://www.thingiverse.com/favicon.ico"> [Thingiverse](https://www.thingiverse.com/jgphilpott)
### <img align="left" width="25" height="25" src="https://pinshape.com/favicon.ico"> [Pinshape](https://pinshape.com/users/964002)
### <img align="left" width="25" height="25" src="https://www.myminifactory.com/favicon.ico"> [MyMiniFactory](https://www.myminifactory.com/users/jgphilpott)
### <img align="left" width="25" height="25" src="https://grabcad.com/favicon.ico"> [GrabCAD](https://grabcad.com/jacob.philpott-1)
### <img align="left" width="25" height="25" src="https://www.youmagine.com/favicon.ico"> [YouMagine](https://www.youmagine.com/jgphilpott)
### <img align="left" width="25" height="25" src="https://cults3d.com/favicon.ico"> [Cults](https://cults3d.com/en/users/jgphilpott)