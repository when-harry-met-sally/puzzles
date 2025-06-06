

function titleToNumber(columnTitle: string) {
  const m = {
    a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: 7,
    h: 8, i: 9, j: 10, k: 11, l: 12, m: 13, n: 14,
    o: 15, p: 16, q: 17, r: 18, s: 19, t: 20, u: 21,
    v: 22, w: 23, x: 24, y: 25, z: 26
  }
  let amount = 0;
  for (let i = 0; i < columnTitle.length; i++) {
    const c = columnTitle[i].toLowerCase();
    if (i < columnTitle.length - 1 && columnTitle.length !== 1) {
      amount += (m[c] * 26)
    } else {
      amount += m[c];
    }
  }
  return amount;
};

console.log(titleToNumber('A'))
console.log(titleToNumber('AB'))
console.log(titleToNumber('ZY'))

console.log(titleToNumber('FXSHRXW'))
