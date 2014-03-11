package strand

var dnaToRna = map[byte]byte{
	'C': 'G',
	'G': 'C',
	'A': 'U',
	'T': 'A',
}

func ToRna(dna string) string {
	rnaNucleotides := make([]byte, 0, len(dna))
	for _, dnaNucleotide := range []byte(dna) {
		if rnaNucleotide, ok := dnaToRna[dnaNucleotide]; ok {
			rnaNucleotides = append(rnaNucleotides, rnaNucleotide)
		}
	}
	return string(rnaNucleotides)
}
