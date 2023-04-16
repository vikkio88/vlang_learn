module app

import os
import src.console { etc }
import src.libs { Db }
import src.models

enum State {
	login
	dashboard
}

struct Context {
mut:
	logged_in_user ?models.User
}

pub struct App {
	db &Db
mut:
	state State
	ctx   Context
}

pub fn new_app(db &Db) &App {
	return &App{
		db: db
		state: .login
		ctx: Context{
			logged_in_user: none
		}
	}
}

pub fn (mut app App) run() {
	for {
		app.state = match app.state {
			.login {
				app.login()
			}
			.dashboard {
				app.dashboard()
			}
		}
	}

	app.cleanup()
}

fn (mut app App) login() State {
	for {
		println('\n\nLogin\n\n')
		un := os.input('username: ')
		pw := os.input('password: ')
		app.ctx.logged_in_user = app.db.get_user_by_up(un, pw) or {
			println('Login failed, try again...')
			continue
		}

		if app.ctx.logged_in_user != none {
			break
		}
	}

	return .dashboard
}

fn (app App) dashboard() State {
	println('Dashboard')
	println(app.ctx.logged_in_user)

	etc()

	for {
		c := os.input('Q to logout:')
		if c == 'q' {
			break
		}
	}

	return .login
}

pub fn (app App) cleanup() {
	println('cleaning up...\n\n')
	println('done!')
}
