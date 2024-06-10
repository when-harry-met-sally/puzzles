// Given an array rectangles where rectangles[i] = [xi, yi, ai, bi] represents an axis-aligned rectangle. The bottom-left point of the rectangle is (xi, yi) and the top-right point of it is (ai, bi).
//
// Return true if all the rectangles together form an exact cover of a rectangular region.
//
//
//
// Example 1:
//
//
// Input: rectangles = [[1,1,3,3],[3,1,4,2],[3,2,4,4],[1,3,2,4],[2,3,3,4]]
// Output: true
// Explanation: All 5 rectangles together form an exact cover of a rectangular region.
// Example 2:
//
//
// Input: rectangles = [[1,1,2,3],[1,3,2,4],[3,1,4,2],[3,2,4,4]]
// Output: false
// Explanation: Because there is a gap between the two rectangular regions.
// Example 3:
//
//
// Input: rectangles = [[1,1,3,3],[3,1,4,2],[1,3,2,4],[2,2,4,4]]
// Output: false
// Explanation: Because two of the rectangles overlap with each other.
// const getAreaOfPoints = (r: number[]) => {
//   return (r[2] - r[0]) * (r[3] - r[1]);
// }
// function isRectangleCover(rectangles: number[][]): boolean {
//   const m = [null, null, null, null]
//   let t = 0;
//   for (const r of rectangles) {
//     if (m[0] === null || r[0] < m[0]) {
//       m[0] = r[0]
//     }
//     if (m[1] === null || r[1] < m[1]) {
//       m[1] = r[1]
//     }
//     if (m[2] === null || r[2] > m[2]) {
//       m[2] = r[2]
//     }
//     if (m[3] === null || r[3] > m[3]) {
//       m[3] = r[3]
//     }
//
//
//     const a = getAreaOfPoints(r)
//     t += a;
//   }
//   const area = getAreaOfPoints(m);
//   console.log(t)
//   console.log(area)
//   console.log(m)
//   return area === t;
// };
// const rectangles = [[0, 0, 1, 1], [0, 1, 3, 2], [1, 0, 2, 2]];
//
// isRectangleCover(rectangles)


// This is labelled as hard.
// Maybe, a) ensure no overlaps
// the issue is that they could be spaced apart
// can probably move everything down to x axis, add the dimensions?
// which boils down to does the sum of the area of the individual squres equal the area of the new object.
// so you just want to keep track of the boundaries?

// or maybe you get max x l max x r, max l r

// 1,1 4,4 (9)
// 2 x 2 (4)
// 1 x 1  (1)
// 2 x 1 (2)
// 1 x 1 (1)
// 1 x 1 (1)

const getAreaOfPoints = (r: number[]) => {
  return (r[2] - r[0]) * (r[3] - r[1]);
}
const pyt = (x: number, y: number) => {
  return Math.sqrt(Math.pow(x, 2) + Math.pow(y, 2))
}

const get4Points = (r: number[]) => {
  // get the 4 points, then ensure each point is not within
  return [{ x: r[0], y: r[1] }, { x: r[0], y: r[3] }, { x: r[2], y: r[1] }, { x: r[2], y: r[3] }]
}
const doRectanglesOverlap = (r: number[][]) => {
  for (let i = 0; i < r.length; i++) {
    const shape1 = r[i];
    for (let j = 0; j < r.length; j++) {
      if (i == j) {
        continue
      }
      const shape2 = r[j];
      const p2 = get4Points(shape2)

      const intersections = p2.filter((p) => p.x >= shape1[0] && p.x <= shape1[2] && p.y >= shape1[1] && p.y <= shape1[3])
      console.log(intersections.length)
      if (intersections.length > 2) {
        return true
      }

    }
  }
  return false;
}

function isRectangleCover(rectangles: number[][]): boolean {
  const overlap = doRectanglesOverlap(rectangles);
  if (overlap) {
    return false;
  }
  console.log('It does not intersect')
  const m = [null, null, null, null]
  let t = 0;
  for (const r of rectangles) {
    if (m[0] === null) {
      m[0] = r[0]
      m[1] = r[1]
    } else {
      if (pyt(r[0], r[1]) < pyt(m[0], m[1])) {
        m[0] = r[0]
        m[1] = r[1]
      }
    }
    if (m[2] === null) {
      m[2] = r[2]
      m[3] = r[3]
    } else {
      if (pyt(r[2], r[3]) > pyt(m[2], m[3])) {
        m[2] = r[2]
        m[3] = r[3]
      }
    }

    const a = getAreaOfPoints(r)
    t += a;
  }
  const area = getAreaOfPoints(m);
  return area === t;
};

// The issue is overlap.
// THe bounding box has the same area as the individual squares, but there is overlap.
const rectangles = [[0, 1, 3, 2], [1, 0, 2, 2]];

console.log(isRectangleCover(rectangles))

console.log('----')
const interectors = (r: number[][]) => {
  const a = r[0]
  const b = r[1]

  const intersectors = [{ x: a[0], y: b[1] }, { x: a[0], y: b[3] }, { x: b[0], y: a[1] }, { x: b[0], y: a[3] }]

  console.log(intersectors)


}

interectors(rectangles)
