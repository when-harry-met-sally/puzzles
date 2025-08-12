function containsNearbyDuplicate(nums: number[], k: number): boolean {
  const m = {}
  for (let i = 0; i < nums.length; i++) {
    const e = m[nums[i]];
    if (e !== undefined) {
      if (i - e <= k) {
        return true;
      } else {
        m[nums[i]] = i
      }
    } else {
      m[nums[i]] = i
    }
  }
  return false;
};

const n = [1, 2, 3, 1]
const res = containsNearbyDuplicate(n, 3);

console.log(res)
