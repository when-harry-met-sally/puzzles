function isAnagram(s: string, t: string): boolean {
  if (s.length !== t.length) {
    return false;
  }
  const a = {};
  const b = {}
  let c = 0;
  for (const i of s) {
    if (a[i] !== undefined) {
      a[i]++
    } else {
      c++
      a[i] = 1
    }
  }
  let d = 0;
  for (const i of t) {
    if (a[i] === undefined) return false;
    if (b[i] !== undefined) {
      b[i]++
    } else {
      d++
      b[i] = 1
    }
  }

  if (c !== d) {
    return false;
  }

  for (const i of Object.keys(a)) {
    if (b[i] !== a[i]) {
      return false;
    }
  }
  return true;
};

// time: n 
// space: n

console.log(isAnagram("anagram", "nagaram"))

// Alternative was to sort, after a length check, more time complexity and liekly less pace, depending on the sort.
