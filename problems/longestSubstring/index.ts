function lengthOfLongestSubstring(s: string) {
  if (s.length === 1 || s.length === 0) {
    return s.length;
  }
  let max: number = 0;
  for (let i = 0; i < s.length - 1; i++) {
    const c1 = s[i];
    const l = {
      [c1]: true
    }
    for (let j = i + 1; j < s.length; j++) {
      console.log(i, j)
      const c2 = s[j]
      let m = j - i;
      if (m > max) {
        max = m
      }
      if (l[c2]) {
        break;
      } else {
        l[c2] = true;
      }
    }
  }
  return max || s.length;
};


const s = "abcabcbb"
const res = lengthOfLongestSubstring(s)
console.log('-----')
console.log(res)
const s2 = "bbbbb"
const res2 = lengthOfLongestSubstring(s2)
console.log('-----')
console.log(res2)
const s3 = "pwwkew"
const res3 = lengthOfLongestSubstring(s3)
console.log('-----')
console.log(res3)
const s4 = "aab"
const res4 = lengthOfLongestSubstring(s4)
console.log('-----')
console.log(res4)
