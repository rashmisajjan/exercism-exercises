from string import maketrans


class DNA(object):
    """Represent a strand of DNA."""

    __rna_translation_table = maketrans('GCTA', 'CGAU')

    def __init__(self, dna_string):
        self.dna_string = dna_string

    def to_rna(self):
        """Return the RNA complement of the DNA strand."""
        return self.dna_string.translate(self.__rna_translation_table)
