function lengthOfLastWord(s: string): number {
  const trimmed = s.trim().split(" ");
  return trimmed[trimmed.length - 1].length
};

console.log(lengthOfLastWord("Hello                World                          "))
