import scala.util.control.Breaks._

for (i <- 1 to 5) {
  println(s"i = $i")
}

val fruits = Array("apple", "banana", "cherry")

for (fruit <- fruits) {
  println(fruit)
}

for (i <- 1 to 10 if i % 2 == 0) {
  println(s"$i is even")
}

breakable {
  for (i <- 1 to 10 if i % 2 == 0) {
    println(s"$i is even")
    break
  }
}

var y = 0
breakable {
  while (true) {
    println(s"y = $y")
    y += 1
    if (y >= 5) break
  }
}

while (y < 3) {
  println(s"y = $y")
  y += 1
}
