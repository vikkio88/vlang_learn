module main

import arrays


pub fn find(array []int, value int) !int {
	return arrays.binary_search(array, value) or {
		error("value not in array")
	}
}
