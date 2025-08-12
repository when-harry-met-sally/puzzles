// What is Recursion?
// Recursion happens when a function calls itself as part of its own definition. In simple terms, it means a function repeats its execution by calling itself.
// The recursive call is now the last operation.
//
// The result is carried along through the acc parameter (the accumulator), which avoids the need to remember the result of each recursive call.
//
// The recursion is efficient because it is tail-recursive, and the compiler can optimize it.

// Tail recursive
// Tail Recursive
def factorial(n: Int): Int = {
  @annotation.tailrec
  def loop(n: Int, acc: Int): Int = {
    if (n == 0) acc
    else loop(n - 1, n * acc) // Tail-recursive call
  }

  loop(n, 1) // Start with the accumulator value of 1
}

// Non tail recursive
def factorial2(n: Int): Int = {
  if (n == 0) 1
  else n * factorial(n - 1) // Recursive call
}
