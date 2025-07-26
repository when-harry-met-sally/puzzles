function getRow(rowIndex: number): number[] {
  let cur = [1];
  if (rowIndex === 0) {
    return cur;
  }

  for (let i = 1; i <= rowIndex; i++) {
    let new_cur = [];
    console.log("-", i);
    for (let j = 0; j <= i; j++) {
      let c: number;
      if (j === 0 || j === i) {
        c = 1;
      } else {
        let l = cur[j - 1];
        let r = cur[j];
        c = l + r;
      }
      new_cur[j] = c;
    }
    cur = new_cur;
  }

  return cur;
}

console.log(getRow(4));
