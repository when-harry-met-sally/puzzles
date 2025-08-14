def paperwork(n: Int, m: Int): Int = {
  if (n < 0 || m < 0) {
    return 0 
  } else {
    n * m
  }
}

def paperwork2(n: Int, m: Int): Int =
  if (n > 0 && m > 0) n * m else 0
