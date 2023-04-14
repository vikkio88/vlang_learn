module models

fn test_money_to_string() {
	m := new_money_from_unit(Currency.dollar, 1)
	n := new_money_from_uf(Currency.dollar, 1, 50)
	o := new_money_from_uf(Currency.dollar, 1, 50)

	p := new_money_from_fraction(Currency.dollar, 150)

	assert m.to_str() == '1.00 $'
	assert n.to_str() == '1.50 $'
	assert p.to_str() == '1.50 $'
}

fn test_money_operators() {
	m := new_money_from_unit(Currency.dollar, 1)
	n := new_money_from_unit(Currency.dollar, 1)

	res := m + n
	assert res.to_str() == '2.00 $'

	mut o := new_money_from_fraction(Currency.dollar, 50)
	assert (res + o).to_str() == '2.50 $'
	assert (res - o).to_str() == '1.50 $'

	o += new_money_from_unit(Currency.dollar, 10)
	assert o.to_str() == '10.50 $'
	o -= new_money_from_uf(Currency.dollar, 10, 35)
	assert o.to_str() == '0.15 $'
}

fn test_money_add_with_different_currencies() {
	exp := currency_not_matching_error
	eur := new_euros_from_unit(100)
	dollar := new_dollars_from_unit(10)
	eur.add(dollar) or {
		assert err.msg() == exp
		return
	}
	assert false
}

fn test_money_sub_with_different_currencies() {
	exp := currency_not_matching_error
	eur := new_euros_from_unit(100)
	dollar := new_dollars_from_unit(10)
	eur.sub(dollar) or {
		assert err.msg() == exp
		return
	}
	assert false
}
