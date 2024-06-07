package main

import "fmt"

func twoSum(nums []int, target int) []int {
	var m = make(map[int]int)

	// loop through nums
	for i, v := range nums {
		fmt.Println(i)
		if x, ok := m[v]; ok {
			fmt.Println("gucci", x)
			return []int{m[v], i}
		}
		m[target-v] = i
		fmt.Printf("Slice: %v\n", m)
	}
	return nil
}
func main() {
	var nums = []int{2, 7, 11, 15}
	var target = 9
	var res = twoSum(nums, target)
	fmt.Printf("Slice: %v\n", res)
}
