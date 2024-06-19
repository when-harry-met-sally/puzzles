// Search 2D Matrix
// You are given an m x n 2 - D integer array matrix and an integer target.
//
// Each row in matrix is sorted in non - decreasing order.
// The first integer of every row is greater than the last integer of the previous row.
// Return true if target exists within matrix or false otherwise.
//
// Can you write a solution that runs in O(log(m * n)) time ?
//
//   Example 1:







// binary search, probably math floor the x and y, start there. the thing is there are four directions to query in.

// we can only guess left or right

// staircase method is best for a matrix, but i'm going to implement the binary search approach

const searchIterative = (arr: number[], target: number): number => {
  let left = 0;
  let right = arr.length - 1;

  while (left <= right) {
    const mid = Math.floor((left + right) / 2);
    if (arr[mid] === target) {
      return mid;
    } else if (arr[mid] < target) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }
  return -1;
};

const searchMatrix = (matrix: number[][], target: number) => {
  console.log(matrix);
  const firstColumn = matrix.map(m => m[0]);
  const b0 = searchClosestRecursive(firstColumn, target);
  console.log('b0', b0)
  if (b0.match !== undefined) {
    return true
  } else if (b0 === -1) {
    return false
  } else {
    const row = b0.closestLower;
    console.log(row)
    const r = searchIterative(matrix[row], target)
    console.log(r)
    if (r === -1) {
      return false
    } else {
      return true;
    }
  }
}

const matrix = [[1]];


const res = searchMatrix(matrix, 1);
console.log('res', res)
