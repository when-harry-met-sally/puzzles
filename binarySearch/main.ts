const searchRecursive = (arr: number[], target: number, left = 0, right = arr.length - 1): number => {
  if (left > right) {
    return -1;
  }
  const mid = Math.floor((left + right) / 2);
  if (arr[mid] === target) {
    return mid;
  } else if (arr[mid] < target) {
    return searchRecursive(arr, target, mid + 1, right);
  } else {
    return searchRecursive(arr, target, left, mid - 1);
  }
};

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

// Example usage for performance measurement
const arr = Array.from({ length: 1000000 }, (_, i) => i);
const target = 999999;

console.time('Recursive');
console.log(searchRecursive(arr, target));
console.timeEnd('Recursive');

console.time('Iterative');
console.log(searchIterative(arr, target));
console.timeEnd('Iterative');
