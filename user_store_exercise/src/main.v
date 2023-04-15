module main

import src.app { new_app }
import src.models { new_money_from_uf }
import os

fn main() {
	mut a := new_app()
	mut euros := new_money_from_uf(.euro, 735, 65)
	println(euros)
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
