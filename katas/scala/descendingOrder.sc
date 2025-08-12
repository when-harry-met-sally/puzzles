def descendingOrder(num: Int): Int = {
  import scala.collection.mutable.ArrayBuffer

  if (num == 0) return 0

  val digits = ArrayBuffer[Int]()
  var n      = num
  while (n > 0) {
    digits += (n % 10) // <-- use n, not num
    n /= 10
  }

  val sortedDesc = digits.sorted(using Ordering[Int].reverse)
  sortedDesc.foldLeft(0)((acc, d) => acc * 10 + d)
}

println(descendingOrder(3001321)) // 3321100

// def descendingOrder(num: Int): Int =
//   num.toString
//     .sorted
//     .reverse
//     .mkString
//     .toInt
//
// println(descendingOrder(42145)) // 54421
