module main

fn collatz(number int) !int {
	if number < 1 {
		return error("Invalid Number provided, it should be >= 1")
	}

	mut num := number
	mut result := 0
	for i := 1; num > 1; i++ {
		if num % 2 == 0 {
			num = num / 2
		} else {
			num = num * 3 + 1
		}

		result = i
	}

	return result
}

fn main() {
	if v := collatz(0) {
		println('result: ${v}')
	} else {
		println('Error')
	}
}
