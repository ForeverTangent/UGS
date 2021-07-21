//
//  File.swift
//  
//
//  Created by Stanley Rosenbaum on 6/24/21.
//

import Foundation


class AVLNode<E: Comparable & Codable>: Codable, JSONDescription {

	var data: E
	var left: AVLNode<E>?
	var right: AVLNode<E>?



	/**
	The Height of the node.
	*/
	public var height: Int {
		get {
			let theLeftHeight = left?.height ?? 0
			let theRightRight = right?.height ?? 0
			return max(theLeftHeight, theRightRight) + 1
		}
	}

	init(data: E, left: AVLNode<E>? = nil, right: AVLNode<E>? = nil) {
		self.data = data
		self.left = left
		self.right = right
	}

}


extension AVLNode: CustomStringConvertible {

	var debugDescription: String {
		let theLeftDescription = left?.debugDescription ?? ""
		let theRightDescription = right?.debugDescription ?? ""
		return "V:\(self.data)<LC:[ \(theLeftDescription) ]-LR:[ \(theRightDescription) ]>"
	}

	var description: String {
		let noBrackets = removeBracketLinesFromString(jsonDescription)
		var results = "\n"
		for element in noBrackets {
			results = results + element
				.replacingOccurrences(of: "\"data\" : ", with: "")
				.replacingOccurrences(of: ",", with: "")
		}
		return "\nRIGHT\n\(results)\nLEFT\n"
	}

	fileprivate func removeBracketLinesFromString(_ string: String) -> [String] {

		let workString = "\(string)\n"


		let noBrackets = Array(workString.split(separator: "\n"))

		var results = [String]()

		for element in noBrackets {
			if element.contains("{") {
			} else if element.contains("}") {
			} else {
				results.append("\(element)\n")
			}
		}

		return results

	}

}




/**
This is the BinarySearchTree we are going with.

[Based off code here] (https://github.com/danmitu/BST/blob/master/Swift-BST/BST.swift)
// https://medium.com/swift-algorithms-data-structures/learning-advanced-binary-search-tree-algorithms-with-swift-c00588a638fe

*/
class AVLTree<E: Comparable & Codable>: Codable, JSONDescription {

	// MARK: - Properties

	private var root: AVLNode<E>?
	private var _height: Int {
		guard let theRoot = root else { return 0 }
		return theRoot.height
	}
	public var height: Int {
		get {
			return _height
		}
	}

	public var useBalancing = true

	public var count = 0

	private var isEmpty: Bool {
		get {
			guard root != nil else { return false }
			return true
		}
	}


	// MARK: - Class Methods

	public func insert(_ data: E) {
		self.root = insert(data, into: self.root)

		count += 1
	}

	@discardableResult
	private func insert(_ data: E, into node: AVLNode<E>?) -> AVLNode<E>? {
		guard var node = node else {
			return AVLNode(data: data)
		}

		if data < node.data {
			node.left = insert(data, into: node.left)
		} else if data > node.data {
			node.right = insert(data, into: node.right)
		}

		if useBalancing {
			let balanceFactor = getBalanceFactorOfNode(node)

			if balanceFactor <= -2 {
				node = rotateRight(node)
			} else if 2 <= balanceFactor {
				node = rotateLeft(node)
			}
		}

		return node

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


	// MARK: - AVL Balancing


	private func getBalanceFactorOfNode(_ node: AVLNode<E>) -> Int {

		let theLeftNodeHeight = node.left?.height ?? 0
		let theRightNodeHeight = node.right?.height ?? 0

		return theRightNodeHeight - theLeftNodeHeight
	}


	/**
	Returns new root  given a node to rotate left.

	-------(1)                              (3)
	-----------\                           /     \
	-----------(3)        -->      (1)        (4)
	----------/      \                      \
	--------(2)       (4)                  (2)

	- Parameter node: the node to start rotation at.
	- Returns: the new root.
	*/
	private func rotateLeft(_ node: AVLNode<E>) -> AVLNode<E> {

		guard let newRoot = node.right else { return node }

		// If new root has a right child.
		if let swapNode = newRoot.left {
			node.right = swapNode
		} else {
			node.right = nil
		}

		newRoot.left = node

		return newRoot
		
	}


	/**
	Returns new root  given a node to rotate right.

	------(4)                  (2)
	-------/                   /     \
	---(2)        -->  (1)         (4)
	---/    \                        /
	(1)    (3)                 (3)

	- Parameter node: the node to start rotation at.
	- Returns: the new root.
	*/
	private func rotateRight(_ node: AVLNode<E>) -> AVLNode<E> {

		guard let newRoot = node.left else { return node }

		// If new root has a right child.
		if let swapNode = newRoot.right {
			node.left = swapNode
		} else {
			node.left = nil
		}

		newRoot.right = node

		return newRoot

	}



	// MARK: - Traversals

	public func transverseInOrder(_ onVisit: (E)->Void) {
		traverseInOrder(root, onVisit)
	}


	private func traverseInOrder(_ node: AVLNode<E>?, _ onVisit: (E) -> Void) {
		guard let theNode = node else { return }
		traverseInOrder(theNode.left, onVisit)
		onVisit(theNode.data)
		traverseInOrder(theNode.right, onVisit)
	}


	public func transversePostOrder(_ onVisit: (E)->Void) {
		traversePostOrder(root, onVisit)
	}


	private func traversePostOrder(_ node: AVLNode<E>?, _ onVisit: (E) -> Void) {
		guard let theNode = node else { return }
		traversePostOrder(theNode.right, onVisit)
		onVisit(theNode.data)
		traversePostOrder(theNode.left, onVisit)
	}



	// MARK: - Minimum and Maximums

	public func getMinimum() -> E? {
		return getMinimum(root)
	}


	private func getMinimum(_ node: AVLNode<E>?) -> E? {
		guard let theNode = node else { return nil }

		if let theLeftNode = theNode.left {
			return getMinimum(theLeftNode)
		}

		return theNode.data
	}


	public func getMaximum() -> E? {
		return getMaximum(root)
	}


	private func getMaximum(_ node: AVLNode<E>?) -> E? {
		guard let theNode = node else { return nil }

		if let theRightNode = theNode.right {
			return getMaximum(theRightNode)
		}

		return theNode.data
	}


}


extension AVLTree: CustomStringConvertible {
	var debugDescription: String {
		guard let root = root else { return "" }
		return root.debugDescription
	}

	var description: String {
		guard let root = root else { return "" }
		return root.description
	}

	// MARK: - Traversal Debugs

	public func getDebugOfAllInOrder() -> String {
		var allData = [E]()
		transverseInOrder { (theData) in
			allData.append(theData)
		}
		var results = ""
		for element in allData {
			results = "\(results)|\(element)"
		}
		results = "\(results)|"
		return results
	}

	public func getDebugOfAllPostOrder() -> String {
		var allData = [E]()
		transversePostOrder { (theData) in
			allData.append(theData)
		}
		var results = ""
		for element in allData {
			results = "\(results)|\(element)"
		}
		results = "\(results)|"
		return results
	}

}


// MARK: - For Unit Tests / Console Debugging

extension AVLTree {
	/**
	These are public accessors for the private function for the Unit Tests.
	*/
	#if DEBUG

	public var testRoot: AVLNode<E>? {
		get {
			return root
		}
		set {
			root = newValue
		}
	}

	public func testGetBalanceFactorOfNode(_ node: AVLNode<E>) -> Int {
		return getBalanceFactorOfNode(node)
	}

	public func testRotateLeft(_ node: AVLNode<E>) -> AVLNode<E> {
		return rotateLeft(node)
	}

	public func testRotateRight(_ node: AVLNode<E>) -> AVLNode<E> {
		return rotateRight(node)
	}

	#endif


	}
