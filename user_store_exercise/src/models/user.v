module models

import rand

pub struct User {
	id        string
	username  string
	full_name string
	balance   Money
}

pub fn new_user(name string, balance Money) User {
	return User{
		id: rand.ulid()
		username: name.trim_space().replace_each([' ', '.']).to_lower()
		full_name: name
		balance: balance
	}
}
