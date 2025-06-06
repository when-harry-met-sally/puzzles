
const convertToTitle = (columnNumber: number) => {
  console.log('-')
  const m = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
  console.log(columnNumber)
  // single digit
  const i = columnNumber - 1;
  const a = i % 26
  const res = m[a];
  const rr = Math.floor(i / 26);
  if (rr > 26) {
    return `${convertToTitle(rr)}${res}`
  }
  if (rr) {
    return `${m[rr - 1]}${res}`
  } else {
    return res;
  }
};

console.log(convertToTitle(1));

console.log(convertToTitle(3));

console.log(convertToTitle(701));

console.log(convertToTitle(2147483647))
