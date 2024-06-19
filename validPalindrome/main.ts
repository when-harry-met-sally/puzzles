function isPalindrome(s: string): boolean {
  const regex = /[^a-zA-Z0-9]/g;
  const p = s.replace(regex, '').toLowerCase()
  for (let i = 0; i < Math.floor(s.length / 2); i++) {
    if (p[i] !== p[p.length - i - 1]) {
      return false;
    }
  }
  return true
};

const res = isPalindrome("A man, a plan, a canal: Panama")

console.log(res)
