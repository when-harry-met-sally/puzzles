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

function minEatingSpeed(piles: number[], h: number): number {
  for (let i = 0; i < piles[0]; i++) {
    console.log(i)
  }
};

minEatingSpeed([3, 6, 7, 11], 8)
