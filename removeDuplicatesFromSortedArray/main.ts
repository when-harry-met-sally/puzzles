function removeDuplicates(nums: number[]): number {
  if (nums.length === 0) return 0;

  let j = 1;
  for (let i = 1; i < nums.length; i++) {
    if (nums[i] !== nums[i - 1]) {
      nums[j] = nums[i];
      j++;
    }
  }
  return j;
}

// Example usage:
const nums = [1, 1, 2, 3, 3, 3, 4, 5, 5];
const newLength = removeDuplicates(nums);
console.log(newLength); // Output: 5
console.log(nums.slice(0, newLength)); // Output: [1, 2, 3, 4, 5]
