package dna

import "fmt"

type DNA struct {
	strand string
}

type Histogram map[string]int

type dnaCountError struct {
	badNucleotide string
}

func (e dnaCountError) Error() string {
	return fmt.Sprintf("%s isn't a valid nucleotide", e.badNucleotide)
}

func (dna *DNA) Counts() Histogram {
	h := Histogram{"A": 0, "C": 0, "T": 0, "G": 0}
	for _, n := range dna.strand {
		h[string(n)]++
	}
	return h
}

func (dna *DNA) Count(nucleotide string) (int, error) {
	if count, ok := dna.Counts()[nucleotide]; ok {
		return count, nil
	} else if nucleotide == "U" {
		return 0, nil
	} else {
		return 0, dnaCountError{nucleotide}
	}
}
