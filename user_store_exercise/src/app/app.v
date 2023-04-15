module app

import os
import arrays
import src.console
import src.models

enum State {
	login
	dashboard
}

struct Context {
	logged_in_user ?models.User
}

pub struct App {
mut:
	state State
	ctx   Context
}

pub fn new_app() &App {
	return &App{
		state: .login
		ctx: Context{
			logged_in_user: none
		}
	}
}

pub fn (mut app App) run(users []models.User) {
	for {
		app.state = match app.state {
			.login {
				app.login(users)
			}
			.dashboard {
				app.dashboard()
			}
		}
	}

	app.cleanup()
}

fn (app App) login(users []models.User) State {
	for {
		println('\n\nLogin\n\n')
		un := os.input('username: ')
		pw := os.input('password: ')
	}

	return .dashboard
}

fn (app App) dashboard() State {
	return .login
}

pub fn (app App) cleanup() {
	println('cleaning up...\n\n')
	println('done!')
}
