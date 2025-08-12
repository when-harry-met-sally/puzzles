// My Solution
object Kata {
  def boolToWord(boolean: Boolean): String = {
    if (boolean == true) {
      "Yes"
    } else {
      "No"
    }
  }
}

val res1 = Kata.boolToWord(true)

println(res1)

// Other Examples
def boolToWord(boolean: Boolean): String =
  if (boolean) "Yes" else "No"

def boolToWord2(b: Boolean): String = b match {
  case true => "Yes"
  case _    => "No"
}
