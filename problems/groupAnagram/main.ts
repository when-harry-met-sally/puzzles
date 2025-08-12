function groupAnagrams(strs: string[]): string[][] {
  const map = {};
  for (const s of strs) {
    const m = generateAnagramMap(s);
    let p = false;
    Object.keys(map).forEach((i) => {
      const v = map[i]
      if (Object.keys(v.stuff).length !== Object.keys(m).length) {
      } else {
        if (isEquiv(m, v.stuff)) {
          v.members.push(s)
          p = true;
        }
      }
    })
    if (!p) {
      map[s] = {
        stuff: m,
        members: [s]
      }
    }
  }

  return Object.keys(map).map(m => {
    return map[m].members
  })
};
//
// const isEquiv = (a: {}, b: {}) => {
//   const k = Object.keys(a);
//   if (k.length !== Object.keys(b).length) {
//     return false;
//   }
//
//   for (const i of k) {
//     if (b[i] !== a[i]) {
//       return false;
//     }
//   }
//   return true;
// }
//
//
// function generateAnagramMap(s: string) {
//   const m = {}
//   for (const i of s) {
//     if (m[i] !== undefined) {
//       m[i]++
//     } else {
//       m[i] = 1
//     }
//   }
//   return m;
// };

// I just did the anagram problem which had 2 solutions, the hashmap approach I took and the sorting approach.

// This seems like you do the same thing, but rather than returning true/false, you sore the resulting object, and compare.

// The thing is that you need to finish the map building everytime, with the exception of the last case.


function groupAnagrams(strs: string[]): string[][] {
  const map = {};
  for (const s of strs) {
    const sorted = Array.from(s).sort().join('')
    if (map[sorted]) {
      map[sorted].push(s);
    } else {
      map[sorted] = [s]
    }
  }

  return Object.keys(map).map(m => {
    return map[m];
  })
};

// I took the sorted approach, works good.
