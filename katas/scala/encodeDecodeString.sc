import scala.collection.mutable.ListBuffer
object Codec {
  // Encodes a list of strings to a single string.
  def encode(strs: List[String]): String = {
    strs
      .map(str =>
        val l = str.length
        s"$l#$str"
      )
      .mkString
  }

  // Decodes a single string to a list of strings.
  def decode(s: String): List[String] = {
    var i       = 0;
    var l       = ListBuffer.empty[String]
    var lengthy = new StringBuilder
    while (i < s.length) {
      var c = s(i)
      if (c == '#') {
        val n = lengthy.toString.toInt
        val w = s.substring(i + 1, i + 1 + n)
        l.addOne(w)
        i = i + 1 + n
        lengthy.clear()
      } else {
        lengthy.append(c)
        i = i + 1
      }
    }
    l.toList
  }

  def main(args: Array[String]): Unit = {
    val input   = List("hello", "world")
    val encoded = encode(input)
    println(s"Encoded: $encoded")
    val decoded = decode(encoded)
    println(s"Decoded: $decoded")
  }
}

val x = Codec
