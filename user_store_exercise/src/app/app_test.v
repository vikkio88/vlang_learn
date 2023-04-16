module app

import models { new_euros_from_unit, new_user }

fn test_app_context_methods() {
	mut ctx := new_empty_ctx()
	assert ctx.logged_in_user == none

	u := new_user('Test Test', new_euros_from_unit(1))
	ctx.set_user(u)
	assert ctx.logged_in_user != none
	ctx.logout()
	assert ctx.logged_in_user == none
}
