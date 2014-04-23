package etl

import "strings"

func Transform(scores map[int][]string) (r map[string]int) {
	r = make(map[string]int)
	for score, letters := range scores {
		for _, letter := range letters {
			r[strings.ToLower(letter)] = score
		}
	}
	return
}
