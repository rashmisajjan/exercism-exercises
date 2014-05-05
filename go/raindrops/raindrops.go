package raindrops

import "strconv"

func Convert(n int) (s string) {
	if n%3 == 0 {
		s += "Pling"
	}
	if n%5 == 0 {
		s += "Plang"
	}
	if n%7 == 0 {
		s += "Plong"
	}

	if s == "" {
		return strconv.Itoa(n)
	}
	return
}
