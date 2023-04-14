module main

import os

struct App {
mut:
	last string
}

fn (mut app App) run() {
	mut choice := ''
	for {
		println('${app.last}')
		choice = os.input('gimme: ')

		if choice == 'q' {
			break
		}
		app.last = choice
	}

	app.cleanup()
}

fn (app App) cleanup() {
	println('cleaning up...\n\n')
	println('had ${app.last}')
	println('done!')
}

fn main() {
	mut app := &App{}
	cleanup := fn [app] (_ os.Signal) {
		println('\n\nCtrl-C was pressed')
		app.cleanup()
		println('finished. bye!')
		exit(0)
	}
	// .int is the same as os.Signal.int
	os.signal_opt(.int, cleanup) or { println("can't setup handler") }

	app.run()
}
