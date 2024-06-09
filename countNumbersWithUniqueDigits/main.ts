function countNumbersWithUniqueDigits(n: number): number {
  const limit = Math.pow(10, n)
  let l = 0;
  for (let i = 0; i <= 9; i++) {
    for (let j = 0; j <= 9; j++) {
      for (let k = 0; k <= 9; k++) {
        const num = `${i}${j}${k}`;
        for (let c = 0; c < num.length; c++) {
          let r: string;
          if (num[c] === '0') {
          } else {
            r = num.slice(c, num.length)
            if (parseInt(r) > limit) {
              return l
            }
            // this is the issue, we don't care about values with trimmed number
            if (i !== j && i !== k) {
              console.log(r)
              l++
            }
            break;
          }
        }
      }
    }
  }
  return l;
}

console.log(countNumbersWithUniqueDigits(2))

console.log(Math.pow(10, 8) > 999_999_999)

// this approach works, but the issue is 0, 0, 0, 0, 0, 1 is valid. 1, 0, 0, 0, 0, 1.  so we need to permit unique
