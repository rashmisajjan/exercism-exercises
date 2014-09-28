package queenattack

import "fmt"

func fileAndRank(pos string) (file, rank byte, err error) {
	if len(pos) != 2 {
		return 0, 0, fmt.Errorf("bad input length")
	}
	file, rank = pos[0], pos[1]
	if file < 'a' || file > 'h' {
		return 0, 0, fmt.Errorf("invalid file: %q", file)
	}
	if rank < '1' || rank > '8' {
		return 0, 0, fmt.Errorf("invalid rank: %q", rank)
	}
	return file, rank, nil
}

func absDiff(x, y uint8) uint8 {
	if x >= y {
		return x - y
	}
	return y - x
}

// CanQueenAttack determines whether two queens on a chess board can attack
// each other. The positions of the two queens, pos1 and pos2, must be given
// in algebraic notation, i.e. a1 to h8.
// If an argument can't be parsed, an error is returned.
func CanQueenAttack(pos1, pos2 string) (bool, error) {
	file1, rank1, err := fileAndRank(pos1)
	if err != nil {
		return false, fmt.Errorf("CanQueenAttack(%q, %q): bad position %q: %s",
			pos1, pos2, pos1, err.Error())
	}
	file2, rank2, err := fileAndRank(pos2)
	if err != nil {
		return false, fmt.Errorf("CanQueenAttack(%q, %q): bad position %q: %s",
			pos1, pos2, pos2, err.Error())
	}
	if file1 == file2 && rank1 == rank2 {
		return false, fmt.Errorf("CanQueenAttack(%q, %q): both queens on same square",
			pos1, pos2)
	}

	switch {
	case file1 == file2 || rank1 == rank2:
		return true, nil
	case absDiff(file1, file2) == absDiff(rank1, rank2):
		return true, nil
	default:
		return false, nil
	}
}
