//
//  SGDSQueue.swift
//  SGDS
//
//  Created by Stanley Rosenbaum on 10/20/20.
//

import Foundation

class Queue<E> {
	var items  = [E]()

	func push(_ item: E) {
		items.append(item)
	}

	func pop() -> E? {
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

	func clear() {
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
