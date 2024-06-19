function trap(height: number[]) {
  const valleys = [];
  let v: number;
  for (let i = 0; i < height.length; i++) {
    console.log('-----', i)
    const h = height[i];
    if (v !== undefined && h > height[v + 1]) {
      console.log(v)
      valleys.push([v, i])
      console.log('UNSETTING', i)
      v = undefined;
    }
    if ((v === undefined && i !== height.length - 1 && height[i + 1] < h)) {
      let f = false;
      for (let j = i + 1; j < height.length; j++) {
        if (height[j] > height[i + 1]) {
          f = true;
          break;
        }
      }
      if (f) {
        v = i
        console.log('SETTTING', v)
      }
    }
  }
  let s = 0;
  console.log(valleys)
  for (const v of valleys) {
    const m = Math.min(height[v[0]], height[v[1]])
    for (let i = v[0] + 1; i < v[1]; i++) {
      console.log(i, height[i])
      console.log('ADDING', m - height[i])
      s += m - height[i]
    }
  }
  return s;
};

// water has to be between elevation on both ends
// 

// const res = trap([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]);
const res = trap([4, 2, 0, 3, 2, 5]);
// const res = trap([4, 2, 3]);
console.log('res', res)

// For a given start of a valley, you need to find it ever reaches that height, otherwise, you need to move on.
//           --
// --        --
// --    --  --
// ----  ------
// ----  ------
