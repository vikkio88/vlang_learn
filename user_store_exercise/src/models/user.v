module models

import rand

pub struct User {
	id        string
mut:
	password string
	balance  Money
pub:
	full_name string
	username  string
}

pub fn new_user(name string, balance Money) User {
	return User{
		id: rand.ulid()
		username: name.trim_space().replace_each([' ', '.']).to_lower()
		full_name: name
		password: 'qwerty'
		balance: balance
	}
}

pub fn (u User) check_password(password string) bool {
	return u.password == password
}

pub fn (mut u User) update_password(new_password string) {
	u.password = new_password
}

pub fn (mut u User) withdraw(amount Money) bool {
	u.balance = u.balance.sub(amount) or { return false }

	return true
}

pub fn (mut u User) deposit(amount Money) bool {
	u.balance = u.balance.add(amount) or { return false }

	return true
}
