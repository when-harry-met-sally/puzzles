function strongPasswordChecker(password: string): number {

};

// >= 6 chars
// <= 20 chars
// >= 1 lower
// >= 1 upper
// >= 1 digit

// go through, each substring that allows for passing of rules could be used?

const res = strongPasswordChecker("a");

const minCharacterRule = {
  verify: (password: string) => password.length >= 6,
  fix: (password: string, _rules: any[]) => `${password}${'a'.repeat(6 - password.length)}`
}

const maxCharacterRule = {
  verify: (password: string) => password.length <= 20,
  fix: (password: string, _rules: any[]) => `` // remove X strings that don't contribute to another rule, or have a backup.
}
