module console

import term
import os

pub fn cls() {
	term.clear()
}

pub fn etc() {
	_ := os.input('[ENTER] to continue...')
}
