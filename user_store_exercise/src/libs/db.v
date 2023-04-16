module libs

import models { User, new_euros_from_unit, new_user }

[heap]
pub struct Db {
	users []User
}

pub fn new_db() &Db {
	users := [
		new_user('Mario Marii', new_euros_from_unit(10)),
		new_user('Giuseppe Conte', new_euros_from_unit(100000)),
	]
	return &Db{
		users: users
	}
}

pub fn (db Db) get_user_by_up(username string, password string) ?User {
	u := db.users.filter(it.username == username && it.check_password(password))

	if u.len == 1 {
		return u.first()
	}

	return none

}
