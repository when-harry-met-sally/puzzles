function topKFrequent(nums: number[], k: number): number[] {
  const m = {}
  for (const n of nums) {
    if (m[n] !== undefined) {
      m[n]++
    } else {
      m[n] = 1
    }
  }

  const res = Object.keys(m).sort((a, b) => m[b] - m[a]);
  return res.slice(0, k).map(s => parseInt(s))
};

console.log(topKFrequent([1, 1, 1, 2, 2, 3], 2))
// Don't think this is as efficient as it could be, we are sorting out of lazyness, but we really should just find the K top, which is log n?


