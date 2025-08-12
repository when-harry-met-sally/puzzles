// Given two strings needle and haystack, return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.
//
//
//
// Example 1:
//
// Input: haystack = "sadbutsad", needle = "sad"
// Output: 0
// Explanation: "sad" occurs at index 0 and 6.
// The first occurrence is at index 0, so we return 0.
// Example 2:
//
// Input: haystack = "leetcode", needle = "leeto"
// Output: -1
// Explanation: "leeto" did not occur in "leetcode", so we return -1.
// first pass
function strStr(haystack: string, needle: string): number {
  if (needle.length > haystack.length) {
    return -1
  }
  for (let i = 0; i < haystack.length; i++) {
    const n = haystack.slice(i, i + needle.length)
    if (needle === n) {
      return i
    }
    if (haystack.length - i < needle.length) { return - 1 }
  }
  return -1
};
//
// console.log(strStr('stest', 'test'))


// This was a good attempt, but 
// console.log(strStr('mississippi', 'issip'))
// Throws a wrench in it.
// We are ignoring potential successes.
// function strStr(haystack: string, needle: string): number {
//   console.log(haystack, needle);
//   if (needle.length > haystack.length) {
//     return -1
//   }
//   let c = 0;
//   let d = 0;
//   for (let i = 0; i < haystack.length; i++) {
//     console.log(needle[c], '-', haystack[i])
//     if (haystack[i] == needle[c]) {
//       c++
//       if (c === needle.length) {
//         return d
//       }
//     } else {
//       console.log('RESET')
//       c = 0
//
//       d = i;
//     }
//   }
//   return -1
// };
//
console.log(strStr('mississippi', 'issip'))

// first thought, starting at 0, we slice str 0 to length of the needle, compare. However, we can probably do it better. 


// The optimal basic solution is essessnetially, my solution, but done better. By shorting the range you can get rid of hte check and loops.
// There's also the KMP solution, which is more complex, but faster


// LETS DO KMV, BINARY SEARCH TOMORROW
