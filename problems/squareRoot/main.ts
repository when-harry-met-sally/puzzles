function mySqrt(x: number): number {
  let b: number = undefined;
  if (x === 1 || x === 0) {
    return x;
  }
  for (let i = 2; i <= x; i++) {
    // We can do much better with where we start, and probably how we incriment, but I don't want to think about it.
    console.log(x - i, x / i)
    if (i * i > x) {
      b = i;
      break;
    }
  }
  return b - 1;
};

const res = mySqrt(1000);
console.log(res)
