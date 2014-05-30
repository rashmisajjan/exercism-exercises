// Computations for a tale of a wise servant and an innumerate king
//
// There once was a wise servant who saved the life of a prince.
// The king promised to pay whatever the servant could dream up.
// Knowing that the king loved chess, the servant told the king he
// would like to have grains of wheat. One grain on the first square
// of a chess board. Two grains on the next. Four on the third, and so on.

package grains

import "fmt"

// Square returns the number of grains on square n of the chess board.
func Square(n int) (uint64, error) {
	if n < 1 || n > 64 {
		return 0, fmt.Errorf("grains.Square(%d): input is out of range [1..64]", n)
	}
	return 1 << uint(n-1), nil
}

// Total returns the total number of grains on the chessboard.
func Total() uint64 {
	// Total() is the sum of all powers of 2 with exponents 0 to 63.
	// That sum is a 64 bit integer with all bits set to 1.
	return ^uint64(0)
}
