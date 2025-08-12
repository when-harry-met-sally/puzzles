def sumTwoSmallest(numbers: List[Int]): Int = {
  val mins = numbers.foldLeft((Int.MaxValue, Int.MaxValue)) { (acc, a) =>
    if (a < acc._1) {
      (a, acc._1)
    } else if (a < acc._2) {
      (acc._1, a)
    } else {
      acc
    }
  }
  mins._1 + mins._2
}
