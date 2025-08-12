function removeElement(nums: number[], val: number): number {
  console.log(nums)
  nums.sort()
  let k = 0;
  let w = 0;
  for (let i = 0; i < nums.length; i++) {
    if (nums[i] === val) {
      w++
    } else {
      k++
      if (w !== 0) {
        nums.splice(i, w)
        i = i - w
        w = 0;
      }
    }
  }
  if (w !== 0) {
    nums.splice(nums.length - w, w)
  }
  console.log(nums)
  return k
};

const res = removeElement([0, 1, 2, 2, 3, 0, 4, 2], 2)

console.log(res)

// 
function removeElement(nums, val) {
  let insertPos = 0;
  for (let i = 0; i < nums.length; i++) {
    if (nums[i] !== val) {
      nums[insertPos] = nums[i];
      insertPos++;
    }
  }
  return insertPos;
}
