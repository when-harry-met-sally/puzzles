function search(nums: number[], target: number, baseIndex: number = 0): number {
  const length = nums.length;
  if (length === 1) {
    if (nums[0] !== target) {
      return -1
    } else {
      return 0;
    }
  }
  const m = Math.floor(length / 2)

  const val = nums[m];
  console.log(nums)
  console.log('m', m)
  console.log('val', val)
  if (val < target) {
    const t = search(nums.slice(m + 1, nums.length), target)
    return t === -1 ? -1 : baseIndex + m + 1
  } else if (val > target) {
    const t = search(nums.slice(0, m), target)
    return t === -1 ? -1 : m - t
  } else if (val === target) {
    return m;
  }
};

console.log(search([-1, 0, 3, 5, 9, 12, 13], -1))
