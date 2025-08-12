// https://leetcode.com/problems/climbing-stairs/description/

// You are climbing a staircase. It takes n steps to reach the top.
//
// Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
//
//
//
// Example 1:
//
// Input: n = 2
// Output: 2
// Explanation: There are two ways to climb to the top.
// 1. 1 step + 1 step
// 2. 2 steps
// Example 2:
//
// Input: n = 3
// Output: 3
// Explanation: There are three ways to climb to the top.
// 1. 1 step + 1 step + 1 step
// 2. 1 step + 2 steps
// 3. 2 steps + 1 step


const steps = [1, 2];
let target = 2;
const ways = []
steps.forEach(a => {
  let level = 0;
  level += a
  steps.forEach(b => {
    level += b;
    if (level === target) {
      ways.push([a, b])
    }
  })
})
//
//
// console.log(ways)

// Apperently this is just the fibonnaci sequence with a different base.

const bigStepper = (n: number) => {
  if (n <= 1) {
    return 1
  }

  const s = [0, 1, 2];
  for (let i = 3; i <= n; i++) {
    s[i] = s[i - 1] + s[i - 2]
  }

  return s[n]
}

const m: Record<number, number> = {}
const bigStepper2 = (n: number) => {
  // base

  // could memoize but I think that's a downside.
  if (n <= 1) {
    return 1;
  } else {
    if (m[n] !== undefined) {
      return m[n]
    }
    m[n] = bigStepper2(n - 1) + bigStepper2(n - 2)
    return m[n]
  }
}

console.log(bigStepper(3))

console.log(bigStepper2(3))
