module main

const valid_nucleotids = ['A', 'C', 'G', 'T']

fn get_empty_counter() map[string]int {
	mut result := map[string]int{}
	for n in valid_nucleotids {
		result[n] = 0
	}

	return result
}

fn count_nucleotides(strand string) !map[string]int {
	nucleotids := strand.split('')
	
	// if you wanted to exit before this would be better
	// but the tests asks us to show which one is not the correct nucleotid
	// if !nucleotids.all(valid_nucleotids.contains(it)) {
	// 	return error('Not a valid strand!')
	// }

	mut result := get_empty_counter()
	for n in nucleotids {
		if !valid_nucleotids.contains(n) {
			return error('$n is not a valid nucleotide!')
		}
		result[n]++
	}

	return result
}
