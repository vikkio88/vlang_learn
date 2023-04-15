module app

import os
import console

pub struct App {
mut:
	last string
}

pub fn (mut app App) run() {
	mut choice := ''
	for {
		println('choice: ${app.last}')
		choice = os.input('gimme: ')

		if choice == 'q' {
			break
		}
		console.cls()
		app.last = choice
	}

	app.cleanup()
}

pub fn (app App) cleanup() {
	println('cleaning up...\n\n')
	println('last choice was: ${app.last}')
	println('done!')
}