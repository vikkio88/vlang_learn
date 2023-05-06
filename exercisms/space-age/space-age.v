module main

const seconds_in_earth_year = f64(31_557_600.0)

fn get_time_map() map[string]f64 {
	time_map := {
		'mercury': 0.2408467
		'venus':   0.61519726
		'earth':   1.0
		'mars':    1.8808158
		'jupiter': 11.862615
		'saturn':  29.447498
		'uranus':  84.016846
		'neptune': 164.79132
	}

	return time_map
}

fn age(seconds f64, planet string) !f64 {
	planet_factor := get_time_map()[planet.to_lower()] or {
		return error('${planet} is not a valid planet')
	}
	return seconds / seconds_in_earth_year / planet_factor
}
