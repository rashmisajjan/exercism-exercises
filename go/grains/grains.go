// Computations for a tale of a wise servant and an innumerate king
//
// There once was a wise servant who saved the life of a prince.
// The king promised to pay whatever the servant could dream up.
// Knowing that the king loved chess, the servant told the king he
// would like to have grains of wheat. One grain on the first square
// of a chess board. Two grains on the next. Four on the third, and so on.

package grains

// Square returns the number of grains on square n of the chess board.
func Square(n int) uint64 {
	return 1 << uint(n-1)
}

// Total returns the total number of grains on the chessboard.
func Total() uint64 {
	// Total() is the sum of all powers of 2 with exponents 0 to 63.
	// That sum is equal to 2^64 - 1.
	return (1 << 64) - 1
}
