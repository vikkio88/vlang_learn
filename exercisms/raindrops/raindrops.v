module main

fn is_factor(factor int, number int) bool {
	return number % factor == 0
}

fn get_config() map[int]string {
	return {
		3: 'i'
		5: 'a'
		7: 'o'
	}
}

fn raindrops(number int) string {
	mut result := ''

	for factor, vowel in get_config() {
		if is_factor(factor, number) {
			result += 'Pl${vowel}ng'
		}
	}

	if result.is_blank() {
		return number.str()
	}

	return result
}
