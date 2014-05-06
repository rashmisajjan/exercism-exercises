// Compute the Scrabble scores of strings

package scrabble_score

import "unicode"

// Score computes the Scrabble score t for a given string s.
func Score(s string) (t int) {
	for _, r := range s {
		switch unicode.ToLower(r) {
		case 'a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't':
			t += 1
		case 'd', 'g':
			t += 2
		case 'b', 'c', 'm', 'p':
			t += 3
		case 'f', 'h', 'v', 'w', 'y':
			t += 4
		case 'k':
			t += 5
		case 'j', 'x':
			t += 8
		case 'q', 'z':
			t += 10
		default:
			continue
		}
	}
	return
}
