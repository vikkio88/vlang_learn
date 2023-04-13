module models

fn test_money_to_string() {
	m := new_money_from_unit(Currency.dollar, 1)
	n := new_money_from_uf(Currency.dollar, 1, 50)
	o := new_money_from_uf(Currency.dollar, 1, 50)

	p := new_money_from_fraction(Currency.dollar, 150)

	assert m.to_string() == '1.00 $'
	assert n.to_string() == '1.50 $'
	assert p.to_string() == '1.50 $'
}

fn test_money_operators() {
	m := new_money_from_unit(Currency.dollar, 1)
	n := new_money_from_unit(Currency.dollar, 1)

	res := m + n
	assert res.to_string() == '2.00 $'

	mut o := new_money_from_fraction(Currency.dollar, 50)
	assert (res + o).to_string() == '2.50 $'
	assert (res - o).to_string() == '1.50 $'

	o += new_money_from_unit(Currency.dollar, 10)
	assert o.to_string() == '10.50 $'
	o -= new_money_from_uf(Currency.dollar, 10, 35)
	assert o.to_string() == '0.15 $'
}
