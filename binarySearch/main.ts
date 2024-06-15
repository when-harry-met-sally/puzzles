function binarySearch(arr: number[], target: number, left: number = 0, right: number = arr.length - 1): number {
  if (left > right) {
    return -1; // Base case: target is not found
  }

  const mid = Math.floor((left + right) / 2);

  if (arr[mid] === target) {
    return mid; // Target found, return index
  } else if (arr[mid] < target) {
    return binarySearch(arr, target, mid + 1, right); // Recur on the right half
  } else {
    return binarySearch(arr, target, left, mid - 1); // Recur on the left half
  }
}
