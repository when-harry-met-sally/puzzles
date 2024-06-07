const factorial = (n: number) => {
  let f = 1;
  for (let i = 1; i <= n; i++) {
    f *= i;
  }
  return f;
}

const factorial2 = (n: number) => {
  if (n === 1) {
    return n
  }
  return n * factorial2(n - 1)
}

const res = factorial(4)
const res2 = factorial2(4)
console.log(res)
console.log(res2)
