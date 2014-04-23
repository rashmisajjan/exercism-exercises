package hamming

func Distance(strandA, strandB string) int {
	var dist, limit int

	if len(strandA) <= len(strandB) {
		limit = len(strandA)
	} else {
		limit = len(strandB)
	}

	for i := 0; i < limit; i++ {
		if strandA[i] != strandB[i] {
			dist++
		}
	}
	return dist
}
