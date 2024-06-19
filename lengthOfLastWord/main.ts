// function lengthOfLastWord(s: string): number {
//   const trimmed = s.trim().split(" ");
//   return trimmed[trimmed.length - 1].length
// };

const alphabet = "abcdefghijklmnopqrstuvwxyz";

function lengthOfLastWord(s: string) {
  let firstAlphaNumericIndex: number;
  for (let i = s.length - 1; i >= 0; i--) {
    const char = s[i];
    const isAlphabetic = alphabet.includes(char.toLowerCase())
    if (firstAlphaNumericIndex === undefined) {
      if (isAlphabetic) {
        firstAlphaNumericIndex = i
      }
    } else {
      if (!isAlphabetic) {
        return firstAlphaNumericIndex - i
      }
    }
  }
  return firstAlphaNumericIndex + 1
};


console.log(lengthOfLastWord("Hello                World                          "))
