/**
 Do not return anything, modify nums1 in-place instead.
 */
function merge(nums1: number[], m: number, nums2: number[], n: number): void {
  for (let i = 0; i < nums.length; i++) {

  }

};

const res = merge([1, 2, 2, 3, 5, 6], 3, [2, 5, 6], 3)
console.log(res)

// first approach
// iterate through array 1, iterate through aray 2. when i1 is less than or equal to i, and < i1 + , insert, we break after iterating through m or n of each.
// this is compelxity of (nums1 * nums2), not good. 

// you can just preproces and slice, the diff of n and m?

// binary search could be used here?
// binary search, returning either the match or the last value, the index is what's used for the left side on the next;
// this may be 

// splice, length -- m/n, splice that.

// TODO:
