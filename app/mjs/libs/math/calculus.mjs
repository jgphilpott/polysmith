export function findTangent(x, coefficients) {

  let slope = [0]

  for (let i = 1; i < coefficients.length; i++) {
    slope.push(coefficients[i] * i * Math.pow(x, i - 1))
  }

  slope = slope.reduce((a, b) => a + b)

  let intercept = [coefficients[0]]

  for (let i = 1; i < coefficients.length; i++) {
    intercept.push(coefficients[i] * Math.pow(x, i))
  }

  intercept = intercept.reduce((a, b) => a + b) - slope * x

  return [intercept, slope]

}
