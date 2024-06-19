function plusOne(digits: number[]): number[] {
  for (let i = digits.length - 1; i >= 0; i--) {
    if (digits[i] + 1 === 10) {
      digits[i] = 0;
      if (i === 0) {
        digits.unshift(1)
      }
    } else {
      digits[i]++
      break;
    }
  }
  return digits
};


const res = plusOne([9, 9, 9])
console.log(res)

// This is probably the quickest I have solved an easy.

// Trying to think about a more optimal solution.

// We need to start at the end... So, worst case we iterate N times, and then unshifting is N time.
// According to CHATGPT, this is about optimal.
