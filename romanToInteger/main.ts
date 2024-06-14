const ROMAN = {
  I: 1,
  V: 5,
  X: 10,
  L: 50,
  C: 100,
  D: 500,
  M: 1000,
} as const;

const DETRACTORS = {
  I: ['V', 'X'],
  X: ['L', 'C'],
  C: ['D', 'M'],
} as const;

function romanToInt(s: string): number {
  let total = 0;
  for (let i = 0; i < s.length; i++) {
    const char = s[i];
    if (i !== s.length - 1) {
      const next = s[i + 1];
      const D = DETRACTORS[char];
      if (D?.includes(next)) {
        total += ROMAN[next] - ROMAN[char];
        i++
        continue;
      }
    }
    total += ROMAN[char]
  }
  return total;
};

console.log(romanToInt('IXI'))
