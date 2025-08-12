import scala.collection.mutable.ListBuffer
def productExceptSelf(nums: Array[Int]): Array[Int] = {
  var left  = ListBuffer.empty[Int]
  var right = ListBuffer.empty[Int]
  var t     = 1;
  for (num <- nums) {
    left.append(t)
    println(num)
    t = t * num
  }

  t = 1;
  for (num <- nums.reverse) {
    right.append(t)
    println(num)
    t = t * num
  }
  println(left)
  println(right)
  var b = ListBuffer.empty[Int]
  for (i <- 0 to nums.length - 1) {
    val l = if i != 0 then left(i - 1) else 1
    val r = if i != nums.length - 1 then right(i + 1) else 1
    b.append(l * r)
  }
  println(b)

  b.toArray
}

val res = productExceptSelf(Array(1, 2, 3, 4))
println(res.toString())
