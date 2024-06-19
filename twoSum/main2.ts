// function twoSum(numbers: number[], target: number): number[] {
//   for (let i = 0; i < numbers.length - 1; i++) {
//     for (let j = i + 1; j < numbers.length; j++) {
//       const a = numbers[i]
//       const b = numbers[j]
//       if (a + b === target) {
//         return [i + 1, j + 1]
//       }
//     }
//   }
// }
function twoSum(numbers: number[], target: number): number[] {
  let left = 0;
  let right = numbers.length - 1
  while (left < right) {
    const c = numbers[left] + numbers[right]
    if (c === target) {
      return [left, right]
    } else if (c < target) {
      left++
    } else {
      right--
    }
  }
  return []
};

const numbers = [2, 7, 11, 15]

const res = twoSum(numbers, 9)

console.log(res)

// I tried using binary search, but it was horrible. I'm gonna do optimal solution
