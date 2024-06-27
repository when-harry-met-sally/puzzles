function trap(height: number[]) {
  const valleys = [];
  let v: number;
  for (let i = 0; i < height.length; i++) {
    const h = height[i];
    if (v !== undefined) {
      if (h >= height[v] && i !== v + 1) {
        valleys.push([v, i])
        v = undefined;
      } else if (h > height[v + 1]) {
        // fix
        let max: number;
        let f = true;
        for (let j = i; j < height.length; j++) {
          if (height[j] >= height[v]) {
            f = false;
            break;
          }
          if (height[j] > max || max === undefined) {
            max = height[j]
          }
        }
        if (f && height[i] === max) {
          valleys.push([v, i])
          v = undefined;
        }
      }
    }
    if ((v === undefined && i !== height.length - 1 && height[i + 1] < h)) {
      // something that follows the next block is larger than the next block;
      let f = false;
      for (let j = i + 1; j < height.length; j++) {
        if (height[j] > height[i + 1]) {
          f = true;
          break;
        }
      }
      if (f) {
        v = i
      }
    }
  }
  let s = 0;
  for (const v of valleys) {
    const m = Math.min(height[v[0]], height[v[1]])
    for (let i = v[0] + 1; i < v[1]; i++) {
      s += m - height[i]
    }
  }
  // visualize(height)
  return s;
};

// water has to be between elevation on both ends
// 

// const res = trap([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]);
// const res = trap([4, 2, 3]);

const res = trap([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1])

// const res = trap([4, 2, 3]);
console.log('res', res)
const visualize = (height: number[]) => {
  let max = Math.max(...height);
  for (let i = max; i > 0; i--) {
    let r = ''
    for (const h of height) {
      if (h >= i) {
        r += 'X'
      } else {
        r += ' '
      }
    }
    console.log(r)
  }
}

// For a given start of a valley, you need to find it ever reaches that height, otherwise, you need to move on.
//           --
// --        --
// --    --  --
// ----  ------
// ----  ------
