def seriesSum(n: Int): String = {
  var res = (1 to n).foldLeft(0.0) { (acc, a) =>
    {

      var denominator = 4.0 + 3 * (n - 1)

      println(denominator)

      var res = (1 / denominator)

      acc + res

    }
  }

  val rounded = 1 + Math.round(res * 100) / 100.0

  rounded.toString()
}

println(seriesSum(5))
