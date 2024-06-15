function removeDuplicates(nums: number[]): number {
  for (let i = 1; i < nums.length; i++) {
    if (nums[i] === nums[i - 1]) {
      nums.splice(i - 1, 1)
      i--
    }
  };

  console.log(nums)
}
const arr = [1, 1, 1, 1, 2, 2];
removeDuplicates(arr)

