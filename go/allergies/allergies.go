package allergies

var allergens = []string{
	"eggs",
	"peanuts",
	"shellfish",
	"strawberries",
	"tomatoes",
	"chocolate",
	"pollen",
	"cats",
}

// Allergies returns the allergies that a person with a given allergy score
// is allergic to.
func Allergies(score int) []string {
	result := make([]string, 0)
	for i, allergen := range allergens {
		if score&(1<<uint(i)) != 0 {
			result = append(result, allergen)
		}
	}
	return result
}

// AllergicTo checks whether a given allergy score implies an allergy to
// a given allergy.
func AllergicTo(score int, allergen string) bool {
	for i, a := range allergens {
		if a == allergen {
			return score&(1<<uint(i)) != 0
		}
	}
	return false
}
