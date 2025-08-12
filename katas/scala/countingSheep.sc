def countingSheep(num: Int): String = {
  (1 to num).map(i => s"$i sheep...").mkString
}

val res = countingSheep(3)

println(res)
