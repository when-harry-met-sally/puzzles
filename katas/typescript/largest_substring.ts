

const lengthOfLongestSubstring = (str: string) => {
console.log(str)

const map: Record<string, number> = {};

let max = 0;
let start = 0;

console.log(map)

for (let i = 0 ; i < str.length; i++) {
  const c = str[i];
  const entry = map[c];

  if (entry !== undefined && entry >= start) {
    start = entry + 1;
  } else {
    let n = i + 1 - start;
    if (n > max) {
      max = n
    }
  }


  map[c] = i
}

  return max
}

console.log(lengthOfLongestSubstring("abcabcbb"))
