def countPositivesSumNegatives(integers: Array[Int]): (Int, Int) = {
  integers.foldLeft((0, 0)) { (acc, a) =>
    if (a > 0) {
      (acc._1 + 1, acc._2)
    } else {
      (acc._1, acc._2 + a)
    }
  }
}
val res = countPositivesSumNegatives(Array(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, -11, -12, -13, -14, -15))

println(res)

// Other solutions

def countPositivesSumNegatives2(xs: Array[Int]): (Int, Int) =
  (xs.count(_ > 0), xs.filter(_ < 0).sum)

def countPositivesSumNegatives3(integers: Array[Int]): (Int, Int) =
  integers.partition(_ > 0) match { case (pos, neg) => (pos.size, neg.sum) }
