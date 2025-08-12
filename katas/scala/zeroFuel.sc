def zeroFuel(distance: Int, mpg: Int, fuel: Int): Boolean = mpg * fuel >= distance

var res = zeroFuel(100, 3, 4)

println(res)
