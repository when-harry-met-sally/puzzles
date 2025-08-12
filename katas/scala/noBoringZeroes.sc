@annotation.tailrec
def noBoringZeroes(n: Int): Int = {
  if (n == 0) { 0 }
  else if (n % 10 == 0) {
    noBoringZeroes(n / 10)
  } else {
    n
  }
}

println(noBoringZeroes(0))
