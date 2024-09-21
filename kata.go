package main

import "fmt"

func Solution(str string) []string {
	temp := []rune(str)
	l := len(temp)
	s := l/2 + l%2
	var ans []string = make([]string, s)
	ind := 0
	for i, r := range temp {
		ans[ind] += string(r)
		if i%2 == 1 {
			ind++
		}
	}
	if l%2 == 1 {
		ans[ind] += "_"
	}
	return ans
}
func strLen(str string) int {
	return len([]rune(str))
}

func main() {
	ans := Solution("yupasdf")
	fmt.Printf("answer is : %v, len : %v ", ans, len(ans))
}
