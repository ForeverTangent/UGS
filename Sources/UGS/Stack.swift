//
//  File.swift
//  
//
//  Created by Stanley Rosenbaum on 6/3/21.
//

import Foundation

/**
Stack built on Swift's basic array structure.

The elements can be pretty much anything.
*/
struct Stack<E: Codable>: Codable, JSONDescription {
	var items  = [E]()

	mutating func push(_ item: E) {
		items.append(item)
	}

	@discardableResult
	mutating func pop() -> E? {
		guard
			!items.isEmpty
		else {
			return nil
		}
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

	mutating func clear() {
		items.removeAll()
	}
}


extension Stack: CustomStringConvertible {
	var description: String {
		getStackDescription()
	}

	func getStackDescription() -> String {
		var results = "TOP "
		// Reversed because it is a stack.
		for element in items.reversed() {
			results.append("\(element), ")
		}
		results.append("BOTTOM")
		return results
	}
}
