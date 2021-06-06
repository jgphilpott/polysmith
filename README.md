<p align="center"><img width="250" height="250" src="https://github.com/jgphilpott/shapeMaker/blob/master/app/imgs/icon.png"></p>

# Intro

Polymaker is a JavaScript based 3D modeling software that uses [three.js](https://github.com/mrdoob/three.js) and [csg.js](https://github.com/evanw/csg.js) in the background. It can export [STL](https://en.wikipedia.org/wiki/STL_(file_format)) and [OBJ](https://en.wikipedia.org/wiki/Wavefront_.obj_file) files to be used for 3D printing.

# Quick Start

Assuming you have [docker compose installed](https://docs.docker.com/compose/install), clone this repository, navigate into the root directory and run:

```
docker-compose up --build
```

The build will take some time but once it’s done you can view the application by visiting `localhost:4000` in a web browser. In future deployments you can simply use the command:

```
docker-compose up
```

# Usage

To create/view a 3D model you will need to modify the generator function in the main JavaScript file, [home.mjs](https://github.com/jgphilpott/polymaker/blob/master/app/mjs/home.mjs). You can either create a new model from scratch or copy and paste a generator function from one of the '[things](https://github.com/jgphilpott/polymaker/tree/master/app/things)'.

Once you see the desired model in the view you can use `Ctrl + Enter` to download it as an STL file or `Shift + Enter` to download it as an OBJ file. You can use any software you like to slice the STL/OBJ files but [Cura](https://github.com/Ultimaker/Cura) is recommended.

# Connect

I ([Jacob Philpott](https://github.com/jgphilpott)) have used this software for all of my personal 3D models. You can view and download my creations on several different websites listed here:

### <img align="left" width="25" height="25" src="https://pbs.twimg.com/profile_images/378800000251714095/46fe768c2c043def07a604dd24d6523d_400x400.png"> [Thingiverse](https://www.thingiverse.com/jgphilpott)
### <img align="left" width="25" height="25" src="https://pbs.twimg.com/profile_images/499763216981835776/0oPskR_u_400x400.jpeg"> [Pinshape](https://pinshape.com/users/964002)
### <img align="left" width="25" height="25" src="https://pbs.twimg.com/profile_images/1145999607308128256/lJf3dSDD_400x400.png"> [MyMiniFactory](https://www.myminifactory.com/users/jgphilpott)
### <img align="left" width="25" height="25" src="https://pbs.twimg.com/profile_images/1196418087739908096/1q-mp6dz_400x400.jpg"> [GrabCAD](https://grabcad.com/jacob.philpott-1)
### <img align="left" width="25" height="25" src="https://pbs.twimg.com/profile_images/378800000150999367/535822160d96db86e979bc5511ba34bd_400x400.jpeg"> [YouMagine](https://www.youmagine.com/jgphilpott)
### <img align="left" width="25" height="25" src="https://pbs.twimg.com/profile_images/378800000509674306/abac759daf6b662ba7fbd7112f9db559_400x400.png"> [Cults](https://cults3d.com/en/users/jgphilpott)

**I'd love to see all the things you create with Polymaker so please connect and share!** If you have any problems with the software or ideas for new features please [open an issue](https://github.com/jgphilpott/polymaker/issues), thanks!
