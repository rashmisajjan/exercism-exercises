package etl

import "strings"

// Transform a scrabble score lookup system.
func Transform(scores map[int][]string) map[string]int {
    // Initialize a table in the new format with sufficient capacity for
    // the entire alphabet.
	result := make(map[string]int, 26)  

	for score, letters := range scores {
		for _, letter := range letters {
			result[strings.ToLower(letter)] = score
		}
	}

	return result
}
