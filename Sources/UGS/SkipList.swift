//
//  File.swift
//  
//
//  Created by Stanley Rosenbaum on 1/26/22.
//

import Foundation
import AppKit



class SkipNode<E: Comparable & Codable>: Codable, JSONDescription {

	var data: E
	var next: SkipNode<E>?
	var down: SkipNode<E>?

	init(data: E,
		 next: SkipNode<E>? = nil,
		 down: SkipNode<E>? = nil) {
		self.data = data
		self.next = next
		self.down = down
	}

	func peakNext() -> E? {
		guard let next = next else { return nil }
		return next.data
	}

}



extension SkipNode: CustomStringConvertible {
	var description: String {
		"fill me in"
	}

}



class SkipTree<E: Comparable & Codable>: Codable, JSONDescription {

	var head: SkipNode<E>?
	var height: Int

	init(height: Int = 6) {
		self.height = height
	}


	func insertIntoNextNode(_ nextNode: SkipNode<E>, data: E) -> AVLNode<E>? {

		return nil

	}

	func insertIntoDownNode(_ downNode:  SkipNode<E>, data: E) -> AVLNode<E>? {
		return nil
	}


}
