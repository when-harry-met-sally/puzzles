// Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
//
// An input string is valid if:
//
// Open brackets must be closed by the same type of brackets.
// Open brackets must be closed in the correct order.
// Every close bracket has a corresponding open bracket of the same type.
//
//
// Example 1:
//
// Input: s = "()"
// Output: true
// Example 2:
//
// Input: s = "()[]{}"
// Output: true
// Example 3:
//
// Input: s = "(]"
// Output: false
//
//
// Constraints:
//
// 1 <= s.length <= 104
// s consists of parentheses only '()[]{}'.
function isValid(s: string): boolean {
  const inverses = {
    ')': '(',
    '}': '{',
    ']': '['
  } as const;
  const opened = [];
  const openBrackets = new Set(['(', '{', '[']);
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
  return opened.length === 0;
}

console.log(isValid('(['))

// does ( have a corrosponding ),

// when opened, it needs to shut

// ([ bad -- does not have a matching parents
// ([) bad -- not matching parenthesis

// ([)] bad -- closing bracket order

// ([ brackets has to close first

