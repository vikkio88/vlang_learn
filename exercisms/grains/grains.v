module main

import math

fn grains_on_square(square int) !u64 {
	if square < 1 || square > 64 {
		return error('square must be between 1 and 64')
	}
	return u64(math.powi(2, square - 1))
}

fn total_grains_on_board() u64 {
	mut acc := u64(0)
	for i in 1 .. 65 {
		acc += grains_on_square(i) or { panic("THIS SHOULD NOT HAVE HAPPENED!") }
	}

	return acc
}
