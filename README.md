<p align="center">
  <img width="250" height="250" src="https://github.com/jgphilpott/shapeMaker/blob/master/app/imgs/icon.png">
</p>

# Intro

Polymaker is a JavaScript based 3D modeling software that uses [three.js](https://github.com/mrdoob/three.js) and [csg.js](https://github.com/evanw/csg.js) in the background. It can export [STL](https://en.wikipedia.org/wiki/STL_(file_format)) and [OBJ](https://en.wikipedia.org/wiki/Wavefront_.obj_file) files to be used for 3D printing.

# Quick Start

Assuming you have [docker compose installed](https://docs.docker.com/compose/install), clone this repository, navigate into the root directory and run:

```
docker-compose up --build -d
```

The build will take some time but once it’s done you can view the application by visiting `localhost:4000` in a web browser.

# Usage

To create/view a 3D model you will need to modify the generator function in the main JavaScript file, [home.mjs](https://github.com/jgphilpott/polymaker/blob/master/app/mjs/home.mjs). You can either create a new model from scratch or copy and paste a generator function from one of the '[things](https://github.com/jgphilpott/polymaker/tree/master/app/things)'.

Once you see the desired model in the view you can use `Ctrl + Enter` to download it as an STL file or `Shift + Enter` to download it as an OBJ file. You can use any software you like to slice the STL/OBJ files but [Cura](https://github.com/Ultimaker/Cura) is recommended.
