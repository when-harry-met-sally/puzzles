// const longestCommonPrefix = (arr: string[]) => {
//   let shortest = arr[0].length;
//   let w = arr[0];
//   for (let i = 1; i < arr.length; i++) {
//     const a = arr[i];
//     const l = a.length;
//     if (!l) {
//       return ''
//     }
//     if (l < shortest) {
//       shortest = l;
//       w = a//set after?
//     }
//   }
//
//   for (let i = 0; i < shortest; i++) {
//     for (const word of arr) {
//       console.log(word)
//       if (word[i] !== w[i]) {
//         return w.slice(0, i)
//       }
//     }
//   }
//   return w;
// }

// This is the solution suggested by GPT. This was the first solution that came to my mind but I decided aginst it because:
// I didn't think that it could be more performant to check lengths during every iteration.
// I thought that determining the shortest length first would be benificial
// It did not cross my mind that you would only need to iterate to arr[0].length;
// I also thought indexing errors would screw me, but checking for lenght obviously fixes that
const longestCommonPrefix = (arr: string[]): string => {
  if (arr.length === 0) return '';

  for (let i = 0; i < arr[0].length; i++) {
    const char = arr[0][i];
    for (let j = 1; j < arr.length; j++) {
      if (i >= arr[j].length || arr[j][i] !== char) {
        return arr[0].slice(0, i);
      }
    }
  }

  return arr[0];
};

// Example usage:
const arr = ["flower", "flow", "flight"];
const result = longestCommonPrefix(arr);
console.log(result); // Output: "fl"


console.log(longestCommonPrefix(["a", "b"]))
