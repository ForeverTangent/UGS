//
//  SGDSQueue.swift
//  SGDS
//
//  Created by Stanley Rosenbaum on 10/20/20.
//

import Foundation

/**
Queue built on Swift's basic array structure.

The elements can be pretty much anything.
*/
struct Queue<E: Codable>: Codable, JSONDescription {
	var items  = [E]()

	mutating func push(_ item: E) {
		items.append(item)
	}

	mutating func pop() -> E? {
		guard
			!items.isEmpty
		else {
			return nil
		}
		return items.removeFirst()
	}

	func peak() -> E? {
		return items.first
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



extension Queue: CustomStringConvertible {
	var description: String {
		getQueueDescription()
	}

	func getQueueDescription() -> String {
		var returnString = "FRONT, "
		for element in items.reversed() {
			returnString.append("\(element), ")
		}
		returnString.append("BACK")
		return returnString
	}

}
