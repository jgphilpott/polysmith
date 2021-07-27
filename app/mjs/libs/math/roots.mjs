export function findRoots(y=0, coefficients=[]) {

  switch (coefficients.length) {

    case 0:

      return null

    case 1:

      return uniFormula(y, coefficients)

    case 2:

      return linierFormula(y, coefficients)

    case 3:

      return quadraticFormula(y, coefficients)

    case 4:

      return cubicFormula(y, coefficients)

    case 5:

      return polyFormula(y, coefficients)

    default:

      // Credit: https://math.stackexchange.com/a/200622/880755
      return "No general formula exists for polynomials of degree ≥ 5, see Abel–Ruffini theorem: https://en.wikipedia.org/wiki/Abel%E2%80%93Ruffini_theorem"

  }

}

export function uniFormula(y, coefficients) {

  if (y == coefficients[0]) {

    return Infinity

  } else {

    return null

  }

}

export function linierFormula(y, coefficients) {

  return [(y - coefficients[0]) / coefficients[1]]

}

// Credit: https://stackoverflow.com/a/33454565/1544937
export function quadraticFormula(y, coefficients) {

  let roots = []

  let a = coefficients[2]
  let b = coefficients[1]
  let c = coefficients[0] - y

  let positiveRoot = (-b + Math.sqrt(Math.pow(b, 2) - (4 * a * c))) / (2 * a)
  let negativeRoot = (-b - Math.sqrt(Math.pow(b, 2) - (4 * a * c))) / (2 * a)

  if (!isNaN(positiveRoot)) { roots.push(positiveRoot)}
  if (!isNaN(negativeRoot)) { if (negativeRoot != positiveRoot) {roots.push(negativeRoot)} }

  return roots

}

// Credit: https://stackoverflow.com/a/27176424/1544937
export function cubicFormula(y, coefficients) {

  let roots = null

  let a = coefficients[3]
  let b = coefficients[2]
  let c = coefficients[1]
  let d = coefficients[0] - y

  function cuberoot(x) {

    let y = Math.pow(Math.abs(x), 1/3)

    return x < 0 ? -y : y

  }

  if (Math.abs(a) < 1e-8) { // Quadratic case, ax^2 + bx + c = 0

    a = b; b = c; c = d

    if (Math.abs(a) < 1e-8) { // Linear case, ax + b = 0

      a = b; b = c

      if (Math.abs(a) < 1e-8) { // Degenerate case

        return []

      }

      return [-b / a]

    }

    let D = (b * b) - (4 * a * c)

    if (Math.abs(D) < 1e-8) {

      return [-b / (2 * a)]

    } else if (D > 0) {

      return [(-b + Math.sqrt(D)) / (2 * a), (-b - Math.sqrt(D)) / (2 * a)]

    }

    return []

  }

  let p = (3*a*c - b*b) / (3*a*a)
  let q = (2*b*b*b - 9*a*b*c + 27*a*a*d) / (27*a*a*a)

  if (Math.abs(p) < 1e-8) {

    roots = [cuberoot(-q)]

  } else if (Math.abs(q) < 1e-8) {

    roots = [0].concat(p < 0 ? [Math.sqrt(-p), -Math.sqrt(-p)] : [])

  } else {

    let D = q*q/4 + p*p*p/27

    if (Math.abs(D) < 1e-8) {

      roots = [-1.5*q/p, 3*q/p]

    } else if (D > 0) {

      let u = cuberoot(-q/2 - Math.sqrt(D))

      roots = [u - p / (3*u)]

    } else {

      let u = 2 * Math.sqrt(-p/3)
      let t = Math.acos(3*q/p/u) / 3
      let k = 2 * Math.PI / 3

      roots = [u * Math.cos(t), u * Math.cos(t-k), u * Math.cos(t-2*k)]

    }

  }

  for (let i = 0; i < roots.length; i++) {

    roots[i] -= b / (3*a)

  }

  return roots

}

export function polyFormula(y, coefficients) {

  return "https://en.wikipedia.org/wiki/Quartic_function"

}
