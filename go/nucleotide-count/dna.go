package dna

import "fmt"

type DNA string

type Histogram map[byte]int

func (dna DNA) Counts() Histogram {
	h := Histogram{'A': 0, 'C': 0, 'T': 0, 'G': 0}
	for i := 0; i < len(dna); i++ {
		h[dna[i]]++
	}
	return h
}

func (dna DNA) Count(n byte) (int, error) {
	if count, ok := dna.Counts()[n]; ok {
		return count, nil
	} else if n == 'U' {
		return 0, nil
	} else {
		return 0, fmt.Errorf("%[1]q.Count(%[2]q): invalid nucleotide %[2]q", dna, n)
	}
}
