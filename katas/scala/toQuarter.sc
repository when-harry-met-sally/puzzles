// https://www.codewars.com/kata/5ce9c1000bab0b001134f5af/solutions/scala

def quarterOf(month: Int): Int = month match {
  case m if 1 to 3 contains m   => 1
  case m if 4 to 6 contains m   => 2
  case m if 7 to 9 contains m   => 3
  case m if 10 to 12 contains m => 4
}

def quarterOf3(month: Int): Int = (1 to month).grouped(3).size
def quarterOf2(month: Int): Int = 1 + (month - 1) / 3
