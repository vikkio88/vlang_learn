module models

fn test_build_user() {
	u := new_user('Mario Stuff', new_euros_from_unit(1000))
	u2 := new_user('Luigi Stuff', new_euros_from_unit(300))

	assert u.id != 'a fixed string'
	assert u.username == 'mario.stuff'
	assert u.balance.str() == '1000.00 €'

	assert u2.id != u.id
	assert u2.username == 'luigi.stuff'
	assert u2.balance.str() == '300.00 €'
}

fn test_passwords_methods() {
	mut u := new_user('Mario Stuff', new_euros_from_unit(1000))

	assert u.password == 'qwerty'
	assert u.check_password('qwerty') == true
	u.update_password('qwertyuiop')
	assert u.check_password('qwertyuiop') == true
}

fn test_bank_ops_methods() {
	mut u := new_user('Mariano Taiano', new_euros_from_unit(100))
	euros := new_euros_from_unit(10)
	dollars := new_dollars_from_unit(2000)

	assert u.deposit(euros) == true
	assert u.balance.str() == '110.00 €'
	assert u.deposit(dollars) == false
	assert u.balance.str() == '110.00 €'

	assert u.withdraw(euros) == true
	assert u.balance.str() == '100.00 €'
	assert u.deposit(dollars) == false
	assert u.balance.str() == '100.00 €'
}
