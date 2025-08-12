// first thought is sorting would make this much easier, but... we are required to do o(n), sorting is n log n

// I watched video, it seems like you make a hash set (n).

// you go through each item and check if it starts a sequence, ignore otherwise.
// if it does start sequence, look to the right and start counting?

function longestConsecutive(nums: number[]): number {
  if (!nums.length) {
    return 0;
  }
  const numsSet = new Set(nums);
  let max = 1;
  for (const s of numsSet) {
    const prev = s - 1;
    if (!numsSet.has(prev)) {
      let c = 1;
      let cur = s + 1;
      while (numsSet.has(cur)) {
        c++
        cur++
      }
      if (c > max) {
        max = c
      }
    }

  }
  return max;
};

console.log(longestConsecutive([100, 4, 200, 1, 3, 2]))

// We should redo this with the inferior sorting method.
