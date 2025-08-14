  def nbDig(n: Int, d: Int): Int = {
    var count = 0;
    for (i <- 0 to n) {
      var t = i * i 
      var counting = true;

      while counting do {
        var b = if t < 10 then t else t % 10
        if (b == d) {
          count += 1
        }
        if (t < 10) {
          counting = false
        }
        t /= 10
      }
    }
    count
  }

  println(nbDig(5750, 0))
