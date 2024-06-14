const add = (a: number, b: number) => {
  return a + b;
}

const multiply = (a: number, b: number) => {
  return a * b;
}

const subtract = (a: number, b: number) => {
  return a - b;
}

const divide = (a: number, b: number) => {
  return Math.trunc(a / b)
}

function evalRPN(tokens: string[]): number {
  let stack: number[] = [];
  const operators = {
    "+": add,
    "*": multiply,
    "/": divide,
    "-": subtract
  } as const;
  for (const token of tokens) {
    const operator = operators[token];
    if (operator) {
      const b = stack.pop()
      const a = stack.pop()
      const n = operator(a, b);

      stack.push(n)
    } else {
      stack.push(parseInt(token))
    }
  }
  return stack[0]
};

// const tokens = ["2", "1", "+", "3", "*"]; 9

// const tokens = ["4", "3", "-"]
// console.log(evalRPN(tokens))

console.log(Math.floor(3.3))
