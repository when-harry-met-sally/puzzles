def mutate(s: String): String = {
  var rx = s
  rx = "x"
  rx
}

def index(s: Array[String]): String = {
  s(0)
}

def mutateArray(s: Array[String]): Array[String] = {
  s(0) = "a"
  s
}
