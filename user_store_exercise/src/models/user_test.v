module models

fn test_build_user() {
	u := new_user('Mario Stuff', new_euros_from_unit(1000))
	u2 := new_user('Luigi Stuff', new_euros_from_unit(300))

	assert u.id != 'a fixed string'
	assert u.username == 'mario.stuff'
	assert u.balance.to_str() == '1000.00 €'

	assert u2.id != u.id
	assert u2.username == 'luigi.stuff'
	assert u2.balance.to_str() == '300.00 €'
}
