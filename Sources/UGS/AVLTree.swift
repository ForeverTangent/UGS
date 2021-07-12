//
//  File.swift
//  
//
//  Created by Stanley Rosenbaum on 6/24/21.
//

import Foundation


class AVLNode<E: Comparable & Codable>: Codable {
	init(data: E) { self.data = data }
	var data: E
	var left: AVLNode<E>?
	var right: AVLNode<E>?

	public var height: Int {
		get {
			let theLeftHeight = left?.height ?? 0
			let theRightRight = right?.height ?? 0
			return max(theLeftHeight, theRightRight) + 1
		}
	}

}

extension AVLNode: CustomStringConvertible {
	var debugDescription: String {

		let theLeftDescription = left?.description ?? ""
		let theRightDescription = right?.description ?? ""

		return "V:\(self.data)<LC:[ \(theLeftDescription) ]-LR:[ \(theRightDescription) ]>"
	}

	var description: String {
		return self.debugDescription
	}
}




/**
This is the BinarySearchTree we are going with.

[Based off code here] (https://github.com/danmitu/BST/blob/master/Swift-BST/BST.swift)
// https://medium.com/swift-algorithms-data-structures/learning-advanced-binary-search-tree-algorithms-with-swift-c00588a638fe

*/
class AVLTree<E: Comparable & Codable>: Codable {

	// MARK: - Properties

	private var root: AVLNode<E>?
	private var height: Int {
		guard let theRoot = root else { return 0 }
		return theRoot.height
	}

	private var isEmpty: Bool {
		get {
			guard root != nil else { return false }
			return true
		}
	}


	// MARK: - Class Methods


	public func insert(_ data: E) {
		if root == nil {
			let rootNode = AVLNode(data: data)
			root = rootNode
		}
	}


	public func containsNodeWith(_ data: E) -> Bool {
		guard getNodeWithData(data) != nil else { return false }
		return true
	}


	public func getNodeWithData(_ data: E) -> AVLNode<E>? {
		var current = root

		while let theNode = current {
			if theNode.data == data {
				return theNode
			}
			if data < theNode.data {
				current = theNode.left
			} else {
				current = theNode.right
			}
		}

		return nil
	}


	/**
	Works double to check hieght and if tree is balanced.
	- Returns: Int of height, -1 if tree is not balanced.
	*/
	private func checkHeight(_ node: AVLNode<E>?) -> Int {
		guard let theNode = node else { return 0 }

		let leftHeight = checkHeight(theNode.left)
		if leftHeight == -1 {
			return -1
		}

		let rightHeight = checkHeight(theNode.right)
		if rightHeight == -1 {
			return -1
		}

		let heightDifference = abs(leftHeight - rightHeight)

		if heightDifference > 1 {
			return -1
		} else {
			return max(leftHeight, rightHeight) + 1
		}

	}


	private func getBalanceFactorOfNode(_ node: AVLNode<E>) -> Int {

		let theLeftNodeHeight = node.left?.height ?? 0
		let theRightNodeHeight = node.right?.height ?? 0

		return theLeftNodeHeight - theRightNodeHeight
	}

}


extension AVLTree: CustomStringConvertible {
	var debugDescription: String {
		guard let root = root else { return "" }
		return root.description
	}

	var description: String {
		return self.debugDescription
	}
}


// MARK: - For Unit Tests / Console Debugging

extension AVLTree {
	/**
	These are public accessors for the private function for the Unit Tests.
	*/
	#if DEBUG



	#endif


	}
