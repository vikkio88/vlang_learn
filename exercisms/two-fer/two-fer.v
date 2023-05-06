module main

fn two_fer(name string) string {
	label := if name.is_blank() { 'you' } else { name }
	return 'One for ${label}, one for me.'
}
