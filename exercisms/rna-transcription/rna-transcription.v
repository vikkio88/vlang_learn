module main

const rnamap = {
	'G': 'C'
	'C': 'G'
	'T': 'A'
	'A': 'U'
}

fn to_rna(dna string) string {
	mut result := ''

	for c in dna.split('') {
		result += rnamap[c]
	}

	return result
}
