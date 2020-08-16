import {degree2radian, radian2degree} from "../tools.mjs"

// In all triangles the sum of the angles is always equal to 180 degrees.
export function angle4angles(x=null, y=null) {

  if (x + y < 180) {

    return 180 - x - y

  } else {

    return null

  }

}

// Remember: SOH-CAH-TOA
export function angle4sides(hypotenuse=null, adjacent=null, opposite=null) {

  if (typeof(hypotenuse) == "number" && !adjacent && typeof(opposite) == "number") {

    return radian2degree(Math.asin(opposite / hypotenuse))

  } else if (typeof(hypotenuse) == "number" && typeof(adjacent) == "number" && !opposite) {

    return radian2degree(Math.acos(adjacent / hypotenuse))

  } else if (!hypotenuse && typeof(adjacent) == "number" && typeof(opposite) == "number") {

    return radian2degree(Math.atan(opposite / adjacent))

  } else {

    return null

  }

}

// Remember: SOH-CAH-TOA
export function side4angles() {

}

// Pythagorean Theorem is a^2 + b^2 = c^2 .. where C is the hypotenuse.
export function side4sides(a=null, b=null, c=null) {

  if (typeof(a) == "number" && typeof(b) == "number" && !c) {

    return Math.sqrt(Math.pow(a, 2) + Math.pow(b, 2))

  } else if (typeof(a) == "number" && !b && typeof(c) == "number") {

    return Math.sqrt(Math.pow(c, 2) - Math.pow(a, 2))

  } else if (!a && typeof(b) == "number" && typeof(c) == "number") {

    return Math.sqrt(Math.pow(c, 2) - Math.pow(b, 2))

  } else {

    return null

  }

}
