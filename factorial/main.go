package main

func main() {
	println(fact(4))
	println(fact2(4))
}

func fact(n int) int {
	var a = 1
	for i := 1; i <= n; i++ {
		a *= i
	}
	return a
}

func fact2(n int) int {
	if n == 1 {
		return 1
	}

	return n * fact2(n-1)
}
