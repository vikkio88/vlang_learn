module main

// NOTE: there are multiple ways to accomplish this. To allow for automated
// testing, please fill out whatever type you choose for the type of roster.
// To make it easy to search, that has been replaced with <TYPE>. Good luck! :)
struct Roster {
mut:
	students     []string
	sorted_grads []int
	link         map[int][]string
}

fn add_student(roster Roster, name string, grade int) Roster {
	mut result := roster
	if name in result.students {
		return result
	}

	result.students << name

	if grade !in result.sorted_grads {
		result.sorted_grads << grade
		result.sorted_grads.sort()
	}

	if grade in result.link {
		result.link[grade] << name
		result.link[grade].sort()
	} else {
		array := [name]
		result.link[grade] = array
	}

	return result
}

fn get_students_in_grade(roster Roster, grade int) []string {
	return roster.link[grade]
}

fn get_all_students(roster Roster) []string {
	mut result := []string{}
	for g in roster.sorted_grads {
		result << roster.link[g]
	}

	return result
}

// This is a helper function that should return an
// empty roster (type of your choosing)
fn create_new_roster() Roster {
	return Roster{
		students: []
		sorted_grads: []
		link: {}
	}
}
