package accumulate

func Accumulate(input []string, f func(string) string) []string {
    result := make([]string, len(input))
    for i, s := range input {
        result[i] = f(s)
    }
    return result
}
