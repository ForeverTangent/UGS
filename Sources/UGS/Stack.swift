//
//  File.swift
//  
//
//  Created by Stanley Rosenbaum on 6/3/21.
//

import Foundation

/**
Stack build on Swift's basic array structure.

The elements can be pretty much anything.
*/
class Stack<E> {
	var items  = [E]()

	func push(_ item: E) {
		items.append(item)
	}

	func pop() -> E? {
		return items.removeLast()
	}

	func peak() -> E? {
		return items.last
	}

	func count() -> Int {
		return items.count
	}

	var isEmpty: Bool {
		get {
			return items.isEmpty
		}
	}

	func clear() {
		items.removeAll()
	}
}


extension Stack: CustomStringConvertible {
	var description: String {
		get {
			getStackDescription()
		}
	}

	func getStackDescription() -> String {
		var results = "TOP, "
		// Reversed because it is a stack.
		for element in items.reversed() {
			results.append("\(element), ")
		}
		results.append("BOTTOM")
		return results
	}
}
