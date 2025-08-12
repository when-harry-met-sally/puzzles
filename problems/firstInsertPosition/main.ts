// 35. Search Insert Position
// Easy
// Topics
// Companies
// Given a sorted array of distinct integers and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.
//
// You must write an algorithm with O(log n) runtime complexity.
//
//
//
// Example 1:
//
// Input: nums = [1,3,5,6], target = 5
// Output: 2
// Example 2:
//
// Input: nums = [1,3,5,6], target = 2
// Output: 1
// Example 3:
//
// Input: nums = [1,3,5,6], target = 7
// Output: 4

// This just seems like binary search with a twist.
// Naive approach
// const searchInsert = (arr: number[], target: number) => {
//   for (let i = 0; i < arr.length; i++) {
//     if (arr[i] >= target) {
//       return i
//     }
//   }
//   return arr.length
// }
// const nums = [1, 3, 5, 6]
// const res = searchInsert(nums, 4)
// console.log(res)



function searchInsert(arr: number[], target: number, left: number = 0, right: number = arr.length - 1): number {
  if (left > right) {
    return -1; // Base case: target is not found
  }

  const mid = Math.floor((left + right) / 2);

  if (arr[mid] < target) {
    return binarySearch(arr, target, mid + 1, right); // Recur on the right half
  } else {
    return binarySearch(arr, target, left, mid - 1); // Recur on the left half
  }
}
