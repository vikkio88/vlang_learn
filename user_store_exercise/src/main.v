module main

import src.app { new_app }
import os

fn main() {
	mut a := new_app()
	cleanup := fn [a] (_ os.Signal) {
		println('\n\nCtrl-C was pressed')
		a.cleanup()
		println('finished. bye!')
		exit(0)
	}
	// .int is the same as os.Signal.int
	os.signal_opt(.int, cleanup) or { println("can't setup handler") }

	a.run()
}
