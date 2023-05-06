module main

const alpha = 'abcdefghijklmnopqrstuvwxyz'

fn is_isogram(word string) bool {
	to_check := word.to_lower()
	alphabet := alpha.runes()
	mut letters := []rune{}
	for l in to_check.runes() {
		if l in alphabet {
			if l in letters {
				return false
			}

			letters << l
		}
	}

	return true
}
