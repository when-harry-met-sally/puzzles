package main

func main() {

}

func bigStepper(n int, m map[int]int) int {
	if n <= 1 {
		return 1
	}

	if val, ok := m[n]; ok {
		return val
	}
	m[n] = bigStepper(n-1, m) + bigStepper(n-2, m)
	return m[n]
}
