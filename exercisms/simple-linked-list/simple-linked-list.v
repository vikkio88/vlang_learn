module main

[heap]
struct Node {
	value int
pub mut:
	next &Node
}

struct LinkedList {
mut:
	head &Node
	len  int // maintain the number of elements in the list in this field
}

fn new() LinkedList {
	return LinkedList{
		head: unsafe { nil }
		len: 0
	}
}

fn from_array(array []int) LinkedList {
	mut list := new()

	for i in array {
		list.push(i)
	}

	return list
}

fn (list LinkedList) is_empty() bool {
	return list.len == 0
}

fn (mut list LinkedList) push(data int) {
	node := &Node{
		value: data
		next: list.head
	}
	list.head = node
	list.len += 1
}

fn (mut list LinkedList) pop() ?int {
	if list.len == 0 {
		return none
	}

	value := list.head.value
	list.head = list.head.next
	list.len -= 1
	return value
}

fn (list LinkedList) peek() ?int {
	if list.len == 0 {
		return none
	}
	return list.head.value
}

fn (list LinkedList) to_array() []int {
	mut result := []int{}
	mut list_copy := list
	for list_copy.len > 0 {
		if val := list_copy.pop() {
			result << val
		}
	}

	return result.reverse()
}

fn (list LinkedList) reverse() LinkedList {
	return from_array(list.to_array().reverse())
}
