socket = io()
client = data.client

d1Line = ["line"]
d1Stroke = ["stroke"]

d2Basic = ["circle", "plane"]
d2Polygons = ["triangle", "quadrilateral", "pentagon", "hexagon", "heptagon", "octagon", "nonagon", "decagon"]
d2Special = ["ring"]

d3Basic = ["box", "cylinder", "sphere"]
d3Hedrons = ["octahedron", "dodecahedron", "icosahedron"]
d3Prisms = ["triangular-prism", "rectangular-prism", "pentagonal-prism", "hexagonal-prism", "heptagonal-prism", "octagonal-prism", "nonagonal-prism", "decagonal-prism", "cylindrical-prism"]
d3Pyramids = ["triangular-pyramid", "rectangular-pyramid", "pentagonal-pyramid", "hexagonal-pyramid", "heptagonal-pyramid", "octagonal-pyramid", "nonagonal-pyramid", "decagonal-pyramid", "cone"]
d3Special = ["capsule", "image", "knot", "text", "torus", "tube"]

d1 = [...d1Line, ...d1Stroke]
d2 = [...d2Basic, ...d2Polygons, ...d2Special]
d3 = [...d3Basic, ...d3Hedrons, ...d3Prisms, ...d3Pyramids, ...d3Special]

meshes = []
lights = []

serverStore = new ServerStorage()
localStore = new LocalStorage()

importer = new Importer()
exporter = new Exporter()

settings = new Settings()
page = new Page()

printer = new Printer()

tooltips = new Tooltips()

navbar = new NavBar()
forkme = new ForkMe()
metabox = new MetaBox()
help = new Help()

renderer = new THREE.WebGLRenderer alpha: true, antialias: true, logarithmicDepthBuffer: true
renderer.setSize window.innerWidth, window.innerHeight
renderer.setPixelRatio window.devicePixelRatio
composer = new THREE.EffectComposer renderer

canvas = document.body.appendChild renderer.domElement
canvas.setAttribute "id", "canvas"

scene = new THREE.Scene()
panels = new Panels()

new Light("ambient").add()
new Light("point").add()

panels.add()

camera = new Camera()
controls = new Controls()

camera.add()
controls.add()

events = new Events camera, canvas

grid = new Grid(); grid.add()




composer.renderPass = new THREE.RenderPass scene, camera
composer.shaderPass = new THREE.ShaderPass THREE.CopyShader
composer.outlinePass = new THREE.OutlinePass new THREE.Vector2(window.innerWidth, window.innerHeight), scene, camera

composer.outlinePass.hiddenEdgeColor.set whiteThree
composer.outlinePass.visibleEdgeColor.set blackThree
composer.outlinePass.overlayMaterial.blending = THREE.CustomBlending

composer.addPass composer.renderPass
composer.addPass composer.shaderPass
composer.addPass composer.outlinePass

animate = ->

    requestAnimationFrame animate

    composer.render()

if typeof polygen is "function"

    localStore.write "meshes", []

    polygen()

else if client

    localStore.delete "meshes"

    serverStore.loadMeshes()

else

    if localRead "meshes"

        localStore.loadMeshes()

    else

        localStore.write "meshes", meshes

animate()
