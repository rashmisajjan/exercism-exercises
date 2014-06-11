package triangle

import (
	"math"
	"sort"
)

// A Kind denotes a type of triangle.
type Kind uint8

// Kinds of triangles.
const (
	Equ Kind = iota // equilateral
	Iso             // isosceles
	Sca             // scalene
	NaT             // not a triangle
)

// KindFromSides returns the Kind of the triangle defined by the lengths
// of its sides a, b and c.
func KindFromSides(a, b, c float64) Kind {
	sides := []float64{a, b, c}

	// Return NaT if any of the sidelengths are invalid.
	for _, n := range sides {
		if n <= 0 || math.IsInf(n, 1) || math.IsNaN(n) {
			return NaT
		}
	}
	sort.Float64s(sides)

	switch {
	case sides[0]+sides[1] <= sides[2]:
		return NaT
	case a == b && b == c:
		return Equ
	case sides[0] == sides[1] || sides[1] == sides[2]:
		return Iso
	default:
		return Sca
	}
}
