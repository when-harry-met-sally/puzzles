implicit class StringExtensions(s: String) {
  def test() = {
    def go(str: List[Char], acc: List[Char]): List[Char] = str match {
      case y :: x :: rest if x.isLetter && !y.isLetter => go(rest, x.toUpper :: y :: acc)
      case x :: rest        => go(rest, x.toLower :: acc)
      case Nil              => acc.reverse
    }
    val l  = s.toList
    val ll = l match {
      case hd :: rest => hd.toUpper :: rest
      case _          => Nil
    }
    val r = go(ll, List()) // capitalize first letter here
    r.mkString
  }
  def toJadenCase = test()
  
}

val res = "9e6sjQjcsA4BJNW8cH YIH3VvaTqJiPnmrs5 i m h18GAk xuv5yBAOqg3k ewI z9qHEZkFJ7 A5fPuNSkg r5d".toJadenCase

println("9e6sj[qjcsa4bjnw8ch Yih3vvatqjipnmrs5 I M H18gak Xuv5ybaoqg3k Ewi Z9qhezkfj7 A5fpuns]kg R5d")
println(res)

//
// but got 
//
// "9e6sj[QjcsA4BJNW8cH YIH3VvaTqJiPnmrs5 I M H18GAk Xuv5yBAOqg3k EwI Z9qHEZkFJ7 A5fPuNS]kg R5d"
