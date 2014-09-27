package triangle

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
	switch {
	case !(a+b > c && a+c > b && b+c > a):
		return NaT
	case a == b && b == c:
		return Equ
	case a == b || a == c || b == c:
		return Iso
	default:
		return Sca
	}
}
