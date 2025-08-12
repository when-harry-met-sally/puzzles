function dailyTemperatures(temperatures: number[]): number[] {
  const p = new Array(temperatures.length).fill(0);
  let stack: { temp: number, removes: number[] }[] = [];
  for (let i = 0; i < temperatures.length; i++) {
    const t = temperatures[i];
    console.log('temp', t)
    console.log('stack', stack)
    for (const stackItem of stack) {
      if (stackItem.temp < t) {
        const removes = stack.shift()
        console.log('removes', removes)
        for (const r of removes.removes) {
          p[r] = i - r
        }
      } else if (stackItem.temp === t) {
        stackItem.removes.push(i)
        break;
      } else {
        stack.unshift({ temp: t, removes: [i] })
        break;
      }
    }

    if (!stack.length) {
      stack.unshift({ temp: t, removes: [i] })
    }

  }
  return p
};

console.log(dailyTemperatures([73, 74, 75, 71, 69, 72, 76, 73]))

// Running out of time on a massive array that is 76, all the same value.
// Don't think sorting or deduping can help since 'i' cannot be lost, but we could do some sort of logic.
// Do we just check if its the same as last temp?

// The thing i'm thinking of is that if temperatures range more than days, which it seems they do, then make it more temperature oriented.
