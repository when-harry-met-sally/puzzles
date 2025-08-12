function generate(numRows: number): number[][] {
  const base = [[1], [1, 1]];
  if (numRows === 1) {
    return [base[0]]
  } else {
    if (numRows === 2) {
      return base;
    }
  }
  for (let i = 3; i <= numRows; i++) {
    const b = [1]
    for (let j = 1; j <= i - 2; j++) {
      const c = base[i - 2][j - 1] + base[i - 2][j]
      b.push(c)
    }
    base.push([...b, 1])
  }

  return base
};

const res = generate(6)
console.log(res)
