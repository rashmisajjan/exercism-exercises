package strand

func ToRNA(dna string) string {
        rnaNucleotides := make([]byte, 0, len(dna))
        for _, dnaNucleotide := range []byte(s) {
                append(rnaNucleotides, switch dnaNucleotide {
                                       case 'C': 'G'
                                       case 'G': 'C'
                                       case 'A': 'U'
                                       case 'T': 'A'
                                       default: dnaNucleotide
                                       })
        }

        return string(rnaNucleotides)
}
