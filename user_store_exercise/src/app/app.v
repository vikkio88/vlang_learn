module app

import os
import src.console { etc, cls }
import src.libs { Db }
import src.models { User }

enum State {
	login
	dashboard
}

struct Context {
mut:
	logged_in_user ?User
}

fn (mut ctx Context) set_user(user User) {
	ctx.logged_in_user = user
}

fn (mut ctx Context) logout() {
	ctx.logged_in_user = none
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
		cls()
		println('\n\nLogin\n\n')
		un := os.input('username: ')
		pw := os.input('password: ')
		user := app.db.get_user_by_up(un, pw) or {
			cls()
			println('\n\nLogin failed, try again...')
			etc()
			continue
		}

		app.ctx.set_user(user)
		break
	}

	return .dashboard
}

fn (mut app App) dashboard() State {
	user := app.ctx.logged_in_user or {
		return .login
	}
	cls()
	println('\n\nDashboard')
	println('Welcome ${user.full_name}\n\n')

	for {
		c := os.input('Q to logout:')
		if c == 'q' {
			println("Logging you out...")			
			etc()
			app.ctx.logout()
			break
		}
	}

	return .login
}

pub fn (app App) cleanup() {
	println('cleaning up...\n\n')
	println('done!')
}
