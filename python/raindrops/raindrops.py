def raindrops(n):
    drops = []

    if divisible_by(n, 3):
        drops.append('Pling')
    if divisible_by(n, 5):
        drops.append('Plang')
    if divisible_by(n, 7):
        drops.append('Plong')

    if not drops:
        return str(n)
    return ''.join(drops)


def divisible_by(n, f):
    return n % f == 0
