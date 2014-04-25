package strand

import (
	"fmt"
	"strings"
)

func ToRna(dna string) string {
	return strings.Map(func(r rune) rune {
		switch r {
		case 'C':
			return 'G'
		case 'G':
			return 'C'
		case 'A':
			return 'U'
		case 'T':
			return 'A'
		default:
			panic(fmt.Sprintf("Invalid nucleotide: %c", r))
		}
	}, dna)
}
