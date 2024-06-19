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
  const max = Math.max(...piles);
  for (let i = 1; i <= max; i++) {
    const res = eatTest(piles, h, i)
    if (res) {
      return i - 1
    }
  }
  return -1
};


const eatTest = (piles: number[], h: number, k: number) => {
  let hours = 0;
  for (const pile of piles) {
    hours += Math.ceil(pile / k);
  }
  return hours <= h;
}

const res = minEatingSpeed([3, 6, 7, 11], 8)
console.log(res)

const res = [].find()
