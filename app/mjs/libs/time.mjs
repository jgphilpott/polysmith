// Link: https://stackoverflow.com/a/951057/1544937

export function sleep(time) {

  return new Promise((resolve) => setTimeout(resolve, time))

  // Usage:
  // sleep(100).then(() => {
      // Do something after the sleep!
  // })

}
