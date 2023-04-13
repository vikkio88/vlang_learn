module models

pub const CURRENCY_NOT_MATCHING_ERROR = "Currencies don't match"

const multi_100 = 100

const multi_100f = 100.0

pub enum Currency {
	euro
	dollar
	pound
}

pub struct Money {
	currency Currency
	val      i32
}

pub fn new_money_from_uf(currency Currency, unit i32, fractional i32) Money {
	return Money{
		val: unit * models.multi_100 + fractional
		currency: currency
	}
}

pub fn new_money_from_fraction(currency Currency, fractional i32) Money {
	return new_money_from_uf(currency, 0, fractional)
}

pub fn new_money_from_unit(currency Currency, unit i32) Money {
	return Money{
		val: unit * models.multi_100
		currency: currency
	}
}

pub fn new_dollars_from_unit(unit i32) Money {
	return new_money_from_unit(Currency.dollar, unit)
}

pub fn new_euros_from_unit(unit i32) Money {
	return new_money_from_unit(Currency.euro, unit)
}

pub fn (m Money) to_str() string {
	val := f32(m.val) / models.multi_100f
	return '${val:.2f} ${currency_to_string(m.currency)}'
}

pub fn (m Money) + (n Money) Money {
	return Money{
		val: m.val + n.val
		currency: m.currency
	}
}

pub fn (m Money) add(n Money) !Money {
	if m.currency != n.currency {
		return error(models.CURRENCY_NOT_MATCHING_ERROR)
	}

	return m + n
}

pub fn (m Money) sub(n Money) !Money {
	if m.currency != n.currency {
		return error(models.CURRENCY_NOT_MATCHING_ERROR)
	}

	return m - n
}

pub fn (m Money) - (n Money) Money {
	return Money{
		val: m.val - n.val
		currency: m.currency
	}
}

fn currency_to_string(c Currency) string {
	return match c {
		.euro {
			'€'
		}
		.dollar {
			'$'
		}
		.pound {
			'£'
		}
	}
}
