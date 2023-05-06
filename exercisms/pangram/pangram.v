module main

import arrays

const alpha = 'abcdefghijklmnopqrstuvwxyz'

fn get_count_map() []string {
	return alpha.split('')
}

fn is_pangram(phrase string) bool {
	letters := get_count_map()
	for letter in phrase.to_lower().split('') {
		if idx := arrays.binary_search(letters, letter) {
			letters.delete(idx)
		}
	}

	return letters.len == 0
}
