# Link: https://threejs.org/docs/#api/en/materials/LineDashedMaterial

class DashedLineMaterial extends THREE.LineDashedMaterial

    constructor : (color = blackThree, linewidth = 1, dashSize = 3, gapSize = 2) ->

        super color: color, linewidth: linewidth, dashSize: dashSize, gapSize: gapSize
