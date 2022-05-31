// A customized version of Michael Schlachters CSG wrapper.
// Credit: github.com/manthrax/THREE-CSGMesh

// ## License

// Copyright (c) 2011 Evan Wallace (http://madebyevan.com), under the MIT license.
// THREE.js rework by thrax

// # class CSG
// Holds a binary space partition tree representing a 3D solid. Two solids can
// be combined using the `union()`, `subtract()`, and `intersect()` methods.

class CSG {
    constructor() {
        this.polygons = [];
    }
    clone() {
        let csg = new CSG();
        csg.polygons = this.polygons.map(p=>p.clone())
        return csg;
    }

    toPolygons() {
        return this.polygons;
    }

    union(csg) {
        let a = new Node(this.clone().polygons);
        let b = new Node(csg.clone().polygons);
        a.clipTo(b);
        b.clipTo(a);
        b.invert();
        b.clipTo(a);
        b.invert();
        a.build(b.allPolygons());
        return CSG.fromPolygons(a.allPolygons());
    }

    subtract(csg) {
        let a = new Node(this.clone().polygons);
        let b = new Node(csg.clone().polygons);
        a.invert();
        a.clipTo(b);
        b.clipTo(a);
        b.invert();
        b.clipTo(a);
        b.invert();
        a.build(b.allPolygons());
        a.invert();
        return CSG.fromPolygons(a.allPolygons());
    }

    intersect(csg) {
        let a = new Node(this.clone().polygons);
        let b = new Node(csg.clone().polygons);
        a.invert();
        b.clipTo(a);
        b.invert();
        a.clipTo(b);
        b.clipTo(a);
        a.build(b.allPolygons());
        a.invert();
        return CSG.fromPolygons(a.allPolygons());
    }

    // Return a new CSG solid with solid and empty space switched. This solid is
    // not modified.
    inverse() {
        let csg = this.clone();
        csg.polygons.forEach(p=>p.flip());
        return csg;
    }
}

// Construct a CSG solid from a list of `Polygon` instances.
CSG.fromPolygons=function(polygons) {
    let csg = new CSG();
    csg.polygons = polygons;
    return csg;
}

// # class Vector

// Represents a 3D vector.
//
// Example usage:
//
//     new CSG.Vector(1, 2, 3);

class Vector {
    constructor(x=0, y=0, z=0) {
        this.x=x;
        this.y=y;
        this.z=z;
    }
    copy(v){
        this.x=v.x;
        this.y=v.y;
        this.z=v.z;
        return this
    }
    clone() {
        return new Vector(this.x,this.y,this.z)
    }
    negate() {
        this.x*=-1;
        this.y*=-1;
        this.z*=-1;
        return this
    }
    add(a) {
        this.x+=a.x
        this.y+=a.y
        this.z+=a.z
        return this;
    }
    sub(a) {
        this.x-=a.x
        this.y-=a.y
        this.z-=a.z
        return this
    }
    times(a) {
        this.x*=a
        this.y*=a
        this.z*=a
        return this
    }
    dividedBy(a) {
        this.x/=a
        this.y/=a
        this.z/=a
        return this
    }
    lerp(a, t) {
        return this.add(tv0.copy(a).sub(this).times(t))
    }
    unit() {
        return this.dividedBy(this.length())
    }
    length(){
        return Math.sqrt((this.x**2)+(this.y**2)+(this.z**2))
    }
    normalize(){
        return this.unit()
    }
    cross(b) {
        let a = this;
		const ax = a.x, ay = a.y, az = a.z;
		const bx = b.x, by = b.y, bz = b.z;

		this.x = ay * bz - az * by;
		this.y = az * bx - ax * bz;
		this.z = ax * by - ay * bx;

		return this;
    }
    dot(b){
        return (this.x*b.x)+(this.y*b.y)+(this.z*b.z)
    }
}

//Temporaries used to avoid internal allocation..
let tv0=new Vector()
let tv1=new Vector()

// # class Vertex

// Represents a vertex of a polygon. Use your own vertex class instead of this
// one to provide additional features like texture coordinates and vertex
// colors. Custom vertex classes need to provide a `pos` property and `clone()`,
// `flip()`, and `interpolate()` methods that behave analogous to the ones
// defined by `CSG.Vertex`. This class provides `normal` so convenience
// functions like `CSG.sphere()` can return a smooth vertex normal, but `normal`
// is not used anywhere else.

class Vertex {

    constructor(pos, normal, uv, color) {
        this.pos = new Vector().copy(pos);
        this.normal = new Vector().copy(normal);
        uv && (this.uv = new Vector().copy(uv)) && (this.uv.z=0);
        color && (this.color = new Vector().copy(color));
    }

    clone() {
        return new Vertex(this.pos,this.normal,this.uv,this.color);
    }

    // Invert all orientation-specific data (e.g. vertex normal). Called when the
    // orientation of a polygon is flipped.
    flip() {
        this.normal.negate();
    }

    // Create a new vertex between this vertex and `other` by linearly
    // interpolating all properties using a parameter of `t`. Subclasses should
    // override this to interpolate additional properties.
    interpolate(other, t) {
        return new Vertex(this.pos.clone().lerp(other.pos, t),this.normal.clone().lerp(other.normal, t),this.uv&&other.uv&&this.uv.clone().lerp(other.uv, t), this.color&&other.color&&this.color.clone().lerp(other.color,t))
    }
}
;
// # class Plane

// Represents a plane in 3D space.

class Plane {
    constructor(normal, w) {
        this.normal = normal;
        this.w = w;
    }

    clone() {
        return new Plane(this.normal.clone(),this.w);
    }

    flip() {
        this.normal.negate();
        this.w = -this.w;
    }

    // Split `polygon` by this plane if needed, then put the polygon or polygon
    // fragments in the appropriate lists. Coplanar polygons go into either
    // `coplanarFront` or `coplanarBack` depending on their orientation with
    // respect to this plane. Polygons in front or in back of this plane go into
    // either `front` or `back`.
    splitPolygon(polygon, coplanarFront, coplanarBack, front, back) {
        const COPLANAR = 0;
        const FRONT = 1;
        const BACK = 2;
        const SPANNING = 3;

        // Classify each point as well as the entire polygon into one of the above
        // four classes.
        let polygonType = 0;
        let types = [];
        for (let i = 0; i < polygon.vertices.length; i++) {
            let t = this.normal.dot(polygon.vertices[i].pos) - this.w;
            let type = (t < -Plane.EPSILON) ? BACK : (t > Plane.EPSILON) ? FRONT : COPLANAR;
            polygonType |= type;
            types.push(type);
        }

        // Put the polygon in the correct list, splitting it when necessary.
        switch (polygonType) {
        case COPLANAR:
            (this.normal.dot(polygon.plane.normal) > 0 ? coplanarFront : coplanarBack).push(polygon);
            break;
        case FRONT:
            front.push(polygon);
            break;
        case BACK:
            back.push(polygon);
            break;
        case SPANNING:
            let f = []
              , b = [];
            for (let i = 0; i < polygon.vertices.length; i++) {
                let j = (i + 1) % polygon.vertices.length;
                let ti = types[i]
                  , tj = types[j];
                let vi = polygon.vertices[i]
                  , vj = polygon.vertices[j];
                if (ti != BACK)
                    f.push(vi);
                if (ti != FRONT)
                    b.push(ti != BACK ? vi.clone() : vi);
                if ((ti | tj) == SPANNING) {
                    let t = (this.w - this.normal.dot(vi.pos)) / this.normal.dot(tv0.copy(vj.pos).sub(vi.pos));
                    let v = vi.interpolate(vj, t);
                    f.push(v);
                    b.push(v.clone());
                }
            }
            if (f.length >= 3)
                front.push(new Polygon(f,polygon.shared));
            if (b.length >= 3)
                back.push(new Polygon(b,polygon.shared));
            break;
        }
    }

}

// `Plane.EPSILON` is the tolerance used by `splitPolygon()` to decide if a
// point is on the plane.
Plane.EPSILON = 1e-5;

Plane.fromPoints = function(a, b, c) {
    let n = tv0.copy(b).sub(a).cross(tv1.copy(c).sub(a)).normalize()
    return new Plane(n.clone(),n.dot(a));
}

// # class Polygon

// Represents a convex polygon. The vertices used to initialize a polygon must
// be coplanar and form a convex loop. They do not have to be `Vertex`
// instances but they must behave similarly (duck typing can be used for
// customization).
//
// Each convex polygon has a `shared` property, which is shared between all
// polygons that are clones of each other or were split from the same polygon.
// This can be used to define per-polygon properties (such as surface color).

class Polygon {
    constructor(vertices, shared) {
        this.vertices = vertices;
        this.shared = shared;
        this.plane = Plane.fromPoints(vertices[0].pos, vertices[1].pos, vertices[2].pos);
    }
    clone() {
        return new Polygon(this.vertices.map(v=>v.clone()),this.shared);
    }
    flip() {
        this.vertices.reverse().forEach(v=>v.flip())
        this.plane.flip();
    }
}

// # class Node

// Holds a node in a BSP tree. A BSP tree is built from a collection of polygons
// by picking a polygon to split along. That polygon (and all other coplanar
// polygons) are added directly to that node and the other polygons are added to
// the front and/or back subtrees. This is not a leafy BSP tree since there is
// no distinction between internal and leaf nodes.

class Node {
    constructor(polygons) {
        this.plane = null;
        this.front = null;
        this.back = null;
        this.polygons = [];
        if (polygons)
            this.build(polygons);
    }
    clone() {
        let node = new Node();
        node.plane = this.plane && this.plane.clone();
        node.front = this.front && this.front.clone();
        node.back = this.back && this.back.clone();
        node.polygons = this.polygons.map(p=>p.clone());
        return node;
    }

    // Convert solid space to empty space and empty space to solid space.
    invert() {
        for (let i = 0; i < this.polygons.length; i++)
            this.polygons[i].flip();

        this.plane && this.plane.flip();
        this.front && this.front.invert();
        this.back && this.back.invert();
        let temp = this.front;
        this.front = this.back;
        this.back = temp;
    }

    // Recursively remove all polygons in `polygons` that are inside this BSP
    // tree.
    clipPolygons(polygons) {
        if (!this.plane)
            return polygons.slice();
        let front = []
          , back = [];
        for (let i = 0; i < polygons.length; i++) {
            this.plane.splitPolygon(polygons[i], front, back, front, back);
        }
        if (this.front)
            front = this.front.clipPolygons(front);
        if (this.back)
            back = this.back.clipPolygons(back);
        else
            back = [];
            //return front;
        return front.concat(back);
    }

    // Remove all polygons in this BSP tree that are inside the other BSP tree
    // `bsp`.
    clipTo(bsp) {
        this.polygons = bsp.clipPolygons(this.polygons);
        if (this.front)
            this.front.clipTo(bsp);
        if (this.back)
            this.back.clipTo(bsp);
    }

    // Return a list of all polygons in this BSP tree.
    allPolygons() {
        let polygons = this.polygons.slice();
        if (this.front)
            polygons = polygons.concat(this.front.allPolygons());
        if (this.back)
            polygons = polygons.concat(this.back.allPolygons());
        return polygons;
    }

    // Build a BSP tree out of `polygons`. When called on an existing tree, the
    // new polygons are filtered down to the bottom of the tree and become new
    // nodes there. Each set of polygons is partitioned using the first polygon
    // (no heuristic is used to pick a good split).
    build(polygons) {
        if (!polygons.length)
            return;
        if (!this.plane)
            this.plane = polygons[0].plane.clone();
        let front = []
          , back = [];
        for (let i = 0; i < polygons.length; i++) {
            this.plane.splitPolygon(polygons[i], this.polygons, this.polygons, front, back);
        }
        if (front.length) {
            if (!this.front)
                this.front = new Node();
            this.front.build(front);
        }
        if (back.length) {
            if (!this.back)
                this.back = new Node();
            this.back.build(back);
        }
    }
}

// Inflate/deserialize a vanilla struct into a CSG structure webworker.
CSG.fromJSON=function(json){
    return CSG.fromPolygons(json.polygons.map(p=>new Polygon(p.vertices.map(v=> new Vertex(v.pos,v.normal,v.uv)),p.shared)))
}

export {CSG,Vertex,Vector,Polygon,Plane}

// Return a new CSG solid representing space in either this solid or in the
// solid `csg`. Neither this solid nor the solid `csg` are modified.
//
//     A.union(B)
//
//     +-------+            +-------+
//     |       |            |       |
//     |   A   |            |       |
//     |    +--+----+   =   |       +----+
//     +----+--+    |       +----+       |
//          |   B   |            |       |
//          |       |            |       |
//          +-------+            +-------+
//
// Return a new CSG solid representing space in this solid but not in the
// solid `csg`. Neither this solid nor the solid `csg` are modified.
//
//     A.subtract(B)
//
//     +-------+            +-------+
//     |       |            |       |
//     |   A   |            |       |
//     |    +--+----+   =   |    +--+
//     +----+--+    |       +----+
//          |   B   |
//          |       |
//          +-------+
//
// Return a new CSG solid representing space both this solid and in the
// solid `csg`. Neither this solid nor the solid `csg` are modified.
//
//     A.intersect(B)
//
//     +-------+
//     |       |
//     |   A   |
//     |    +--+----+   =   +--+
//     +----+--+    |       +--+
//          |   B   |
//          |       |
//          +-------+
//

let {BufferGeometry, Vector3, Vector2} = THREE;

CSG.fromGeometry = function(geom,objectIndex) {
    let polys = []
    if (geom.isGeometry) {
        let fs = geom.faces;
        let vs = geom.vertices;
        let fm = ['a', 'b', 'c']
        for (let i = 0; i < fs.length; i++) {
            let f = fs[i];
            let vertices = []
            for (let j = 0; j < 3; j++)
                vertices.push(new Vertex(vs[f[fm[j]]],f.vertexNormals[j],geom.faceVertexUvs[0][i][j]))
            polys.push(new Polygon(vertices, objectIndex))
        }
    } else if (geom.isBufferGeometry) {
        let vertices, normals, uvs
        let posattr = geom.attributes.position
        let normalattr = geom.attributes.normal
        let uvattr = geom.attributes.uv
        let colorattr = geom.attributes.color
        let index;
        if (geom.index)
            index = geom.index.array;
        else {
            index = new Array((posattr.array.length / posattr.itemSize) | 0);
            for (let i = 0; i < index.length; i++)
                index[i] = i
        }
        let triCount = (index.length / 3) | 0
        polys = new Array(triCount)
        for (let i = 0, pli = 0, l = index.length; i < l; i += 3,
        pli++) {
            let vertices = new Array(3)
            for (let j = 0; j < 3; j++) {
                let vi = index[i + j]
                let vp = vi * 3;
                let vt = vi * 2;
                let x = posattr.array[vp]
                let y = posattr.array[vp + 1]
                let z = posattr.array[vp + 2]
                let nx = normalattr.array[vp]
                let ny = normalattr.array[vp + 1]
                let nz = normalattr.array[vp + 2]
                //let u = uvattr.array[vt]
                //let v = uvattr.array[vt + 1]
                vertices[j] = new Vertex({
                    x,
                    y,
                    z
                },{
                    x: nx,
                    y: ny,
                    z: nz
                },uvattr&&{
                    x: uvattr.array[vt],
                    y: uvattr.array[vt+1],
                    z: 0
                },colorattr&&{x:colorattr.array[vt],y:colorattr.array[vt+1],z:colorattr.array[vt+2]});
            }
            polys[pli] = new Polygon(vertices,objectIndex)
        }
    } else
        console.error("Unsupported CSG input type:" + geom.type)
    return CSG.fromPolygons(polys)
}

let ttvv0 = new THREE.Vector3()
let tmpm3 = new THREE.Matrix3();
CSG.fromMesh = function(mesh,objectIndex) {
    let csg = CSG.fromGeometry(mesh.geometry,objectIndex)
    tmpm3.getNormalMatrix(mesh.matrix);
    for (let i = 0; i < csg.polygons.length; i++) {
        let p = csg.polygons[i]
        for (let j = 0; j < p.vertices.length; j++) {
            let v = p.vertices[j]
            v.pos.copy(ttvv0.copy(v.pos).applyMatrix4(mesh.matrix));
            v.normal.copy(ttvv0.copy(v.normal).applyMatrix3(tmpm3))
        }
    }
    return csg;
}

let nbuf3=(ct)=>{
    return{
        top:0,
        array:new Float32Array(ct),
        write:function(v){(this.array[this.top++]=v.x);(this.array[this.top++]=v.y);(this.array[this.top++]=v.z);}
    }
}
let nbuf2=(ct)=>{
    return{
        top:0,
        array:new Float32Array(ct),
        write:function(v){(this.array[this.top++]=v.x);(this.array[this.top++]=v.y)}
    }
}

CSG.toGeometry = function(csg, buffered=true) {
    let ps = csg.polygons;
    let geom;
    let g2;
    if(!buffered) //Old geometry path...
    {
        geom = new Geometry();
        let vs = geom.vertices;
        let fvuv = geom.faceVertexUvs[0]
        for (let i = 0; i < ps.length; i++) {
            let p = ps[i]
            let pvs = p.vertices;
            let v0 = vs.length;
            let pvlen = pvs.length

            for (let j = 0; j < pvlen; j++)
                vs.push(new THREE.Vector3().copy(pvs[j].pos))

            for (let j = 3; j <= pvlen; j++) {
                let fc = new THREE.Face3();
                let fuv = []
                fvuv.push(fuv)
                let fnml = fc.vertexNormals;
                fc.a = v0;
                fc.b = v0 + j - 2;
                fc.c = v0 + j - 1;

                fnml.push(new THREE.Vector3().copy(pvs[0].normal))
                fnml.push(new THREE.Vector3().copy(pvs[j - 2].normal))
                fnml.push(new THREE.Vector3().copy(pvs[j - 1].normal))
                fuv.push(new THREE.Vector3().copy(pvs[0].uv))
                fuv.push(new THREE.Vector3().copy(pvs[j - 2].uv))
                fuv.push(new THREE.Vector3().copy(pvs[j - 1].uv))

                fc.normal = new THREE.Vector3().copy(p.plane.normal)
                geom.faces.push(fc)
            }
        }
        geom = new THREE.BufferGeometry().fromGeometry(geom)
        geom.verticesNeedUpdate = geom.elementsNeedUpdate = geom.normalsNeedUpdate = true;
    }else { //BufferGeometry path
        let triCount = 0;
        ps.forEach(p=>triCount += (p.vertices.length - 2))
         geom = new THREE.BufferGeometry()

        let vertices = nbuf3(triCount * 3 * 3)
        let normals = nbuf3(triCount * 3 * 3)
        let uvs; // = nbuf2(triCount * 2 * 3)
        let colors;
        let grps=[]
        ps.forEach(p=>{
            let pvs = p.vertices
            let pvlen = pvs.length
            if(p.shared!==undefined){
                if(!grps[p.shared])grps[p.shared]=[]
            }
            if(pvlen){
                if(pvs[0].color!==undefined){
                    if(!colors)colors = nbuf3(triCount*3*3);
                }
                if(pvs[0].uv!==undefined){
                    if(!uvs)uvs = nbuf2(triCount * 2 * 3)
                }
            }
            for (let j = 3; j <= pvlen; j++) {
                (p.shared!==undefined) && (grps[p.shared].push(vertices.top/3,(vertices.top/3)+1,(vertices.top/3)+2));
                vertices.write(pvs[0].pos)
                vertices.write(pvs[j-2].pos)
                vertices.write(pvs[j-1].pos)
                normals.write(pvs[0].normal)
                normals.write(pvs[j-2].normal)
                normals.write(pvs[j-1].normal);
                uvs&&(pvs[0].uv)&&(uvs.write(pvs[0].uv)||uvs.write(pvs[j-2].uv)||uvs.write(pvs[j-1].uv));
                colors&&(colors.write(pvs[0].color)||colors.write(pvs[j-2].color)||colors.write(pvs[j-1].color))
            }
        }
        )
        geom.setAttribute('position', new THREE.BufferAttribute(vertices.array,3));
        geom.setAttribute('normal', new THREE.BufferAttribute(normals.array,3));
        uvs && geom.setAttribute('uv', new THREE.BufferAttribute(uvs.array,2));
        colors && geom.setAttribute('color', new THREE.BufferAttribute(colors.array,3));
        if(grps.length){
            let index = []
            let gbase=0;
            for(let gi=0;gi<grps.length;gi++){
                geom.addGroup(gbase,grps[gi].length,gi)
                gbase+=grps[gi].length
                index=index.concat(grps[gi]);
            }
            geom.setIndex(index)
        }
        g2 = geom;
    }
    return geom;
}

CSG.toMesh = function(csg, toMatrix, toMaterial) {
    let geom = CSG.toGeometry(csg);
    let inv = new THREE.Matrix4().copy(toMatrix).invert();
    geom.applyMatrix4(inv);
    geom.computeBoundingSphere();
    geom.computeBoundingBox();
    let m = new THREE.Mesh(geom,toMaterial);
    m.matrix.copy(toMatrix);
    m.matrix.decompose(m.position, m.quaternion, m.scale)
    m.rotation.setFromQuaternion(m.quaternion)
    m.updateMatrixWorld();
    m.castShadow = m.receiveShadow = true;
    return m
}

let gWorkersStarted = false;
let gWorker;
let gWorkerUrl;

let taskId = 0;
let tasks={}
let spawnWorker=()=>{
    const worker = new Worker(gWorkerUrl)

    worker.onmessage = function(e) {
       let rslt = JSON.parse(e.data)
       let task = tasks[rslt.taskId]
       delete tasks[rslt.taskId]
       task.resolve(CSG.fromJSON(rslt.result))
       gWorker.busy = false;
    }
    return gWorker = {worker,busy:false};
}

let getWorker=()=>{
    if(!gWorkersStarted){
        gWorkersStarted = true;
        return fetch('../csg-lib.js').then(function(response) {
            return response.text().then(function(text) {
                text = text.slice(0, text.lastIndexOf('export'));
                const code = text + `
                    self.onmessage=(message)=>{
                    let task = JSON.parse(message.data)
                    //console.log("Got task:"+task.op+' '+task.taskId)
                    postMessage(JSON.stringify({
                        taskId:task.taskId,
                        result : CSG.fromJSON(task.a)[task.op](CSG.fromJSON(task.b))
                    }))
                }
                console.log('CSG worker started!')`
                const blob = new Blob([code],{
                    type: 'application/javascript'
                })
                gWorkerUrl = URL.createObjectURL(blob);


            }).then(()=>{
                return spawnWorker()
            })
        });
    }
    if(gWorker && (!gWorker.busy)){
        gWorker.busy = true;

        return {then:(fn)=>{return fn(gWorker);}}
    }
    return{
        then:function(){return this}
    }
}

CSG.doAsync=(a,op,b)=>{
    return getWorker().then((worker)=>{
        let task={a,op,b,taskId}
        tasks[taskId]=task;
        taskId++;
        task.result = new Promise((resolve,reject)=>{
            task.resolve = resolve;
            worker.busy = true;
            worker.worker.postMessage(JSON.stringify(task))
        })
        return task.result
    })
}

export default CSG