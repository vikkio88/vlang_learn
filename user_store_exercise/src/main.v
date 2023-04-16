module main

import src.app { new_app }
import src.libs { new_db }
import src.models { new_money_from_uf }
import os

fn main() {
	db := new_db()
	mut a := new_app(db)
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
