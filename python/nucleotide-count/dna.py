from collections import Counter


class DNA(object):

    def __init__(self, strand):
        self.strand = strand
        self._counts = Counter({n: 0 for n in "ACGT"})
        self._counts.update(strand)

    def nucleotide_counts(self):
        return self._counts

    def count(self, nucleotide):
        if (nucleotide != 'U') and (nucleotide not in self._counts):
            raise ValueError("{} is not a nucleotide.".format(nucleotide))
        return self._counts[nucleotide]
