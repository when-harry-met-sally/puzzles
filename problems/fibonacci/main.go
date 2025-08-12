package main

// fib function now takes an additional map argument for memoization
func fib(n int, memo map[int]int) int {
	// Check if the result is already in the map
	if val, ok := memo[n]; ok {
		return val
	}
	// Base cases
	if n <= 1 {
		return n
	}
	// Recursive call, store the result in the map
	memo[n] = fib(n-1, memo) + fib(n-2, memo)
	return memo[n]
}

func main() {
	// Initialize the map for memoization
	m := make(map[int]int)
	// Call fib with the map
	println(fib(10, m))
}
