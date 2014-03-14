package strand

import "log"

func ToRna(dna string) string {
	rnaNucleotides := make([]byte, 0, len(dna))
	var complement byte
	for _, dnaNucleotide := range []byte(dna) {
		switch dnaNucleotide {
		case 'C':
			complement = 'G'
		case 'G':
			complement = 'C'
		case 'A':
			complement = 'U'
		case 'T':
			complement = 'A'
		default:
			log.Fatal("Invalid nucleotide")
		}
		rnaNucleotides = append(rnaNucleotides, complement)
	}
	return string(rnaNucleotides)
}
