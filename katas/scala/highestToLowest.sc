def highAndLow(numbers: String): String = {
  var low  = Int.MaxValue;
  var high = Int.MinValue;

  val split = numbers.split(' ');

  for (char <- split) {
    val parsed = char.toInt
    if (parsed < low) {
      low = parsed
    }
    if (parsed > high) {
      high = parsed
    }
  }

  s"$high $low"
}

println(highAndLow("1 0 -1"))

def highAndLow2(numbers: String): String = {
  val xs = numbers.split(' ').map(_.toInt)
  s"${xs.max} ${xs.min}"
}
