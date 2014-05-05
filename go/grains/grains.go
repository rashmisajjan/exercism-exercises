package grains

func Square(n int) uint64 {
	return 1 << (uint64(n) - 1)
}

func Total() (t uint64) {
	for i := 1; i <= 64; i++ {
		t += Square(i)
	}
	return
}
