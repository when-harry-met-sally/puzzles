// iterative
// get the f'th item in fib sequence
// const fib = (f: number) => {
//   if (f === 0 || f === 1) return f;
//   const start = [0, 1];
//   for (let i = 2; i < f; i++) {
//     start.push(start[i - 2] + start[i - 1])
//   }
//   return { start, a: start[f - 1] }
// }
// console.log(fib(10))


// gpt suggests this.
// const fib2 = (f: number): number => {
//   if (f < 2) return f; // Directly return f if it is 0 or 1
//
//   let a = 0, b = 1; // Initialize the first two Fibonacci numbers
//   let c = 0; // This will store the current Fibonacci number during the loop
//
//   for (let i = 2; i <= f; i++) { // Loop from 2 to f inclusive
//     c = a + b; // Calculate the next Fibonacci number
//     a = b;     // Update a to the next value in sequence
//     b = c;     // Update b to the latest calculated Fibonacci number
//   }
//
//   return c; // By the end of the loop, c is the f'th Fibonacci number
// }
//
// // recursive (This was a horrible attempt by me)
// const fib3 = (f: number, a = 0, b = 1, d = 2): number => {
//   if (f < 2) return f;
//   const c = a + b
//   if (d === f) return c;
//   return fib3(b, c, d + 1)
// }

// GPT
// function fib(n: number) {
//   if (n <= 1) {
//     return n;
//   } else {
//     return fib(n - 1) + fib(n - 2);
//   }
// }

// memoed
const fib = (function() {
  const memo = { 0: 0, 1: 1 };  // Cache
  return function(n: number) {
    if (memo[n] !== undefined) return memo[n];
    memo[n] = fib(n - 1) + fib(n - 2);
    return memo[n];
  }
})();

// Example usage:
console.log(fib(10));  // Output: 55

// Example usage:
console.log(fib(2));  // Output: 55
