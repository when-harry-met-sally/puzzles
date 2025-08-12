// https://leetcode.com/problems/generate-parentheses/description/

// Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.
//
//
//
// Example 1:
//
// Input: n = 3
// Output: ["((()))","(()())","(())()","()(())","()()()"]
// Example 2:
//
// Input: n = 1
// Output: ["()"]


function isValid(s: string): boolean {
  const inverses = {
    ')': '(',
  } as const;
  const opened = [];
  const openBrackets = new Set(['(']);
  for (const ss of s) {
    if (openBrackets.has(ss)) {
      opened.push(ss)
    } else {
      if (opened.length === 0) return false; // Early return if no opening bracket to match
      const last = opened.pop()
      const inverse = inverses[ss]
      if (inverse !== last) {
        return false;
      }
    }
  }
  return !opened.length;
}

const generateAll = (n: s) => {

}


// Per usual, a brute force approach comes to mind, where we then filter by isValid, but I don't think this is the right approach.

// Skipping this for now.

//TODO: 
