//
//  File.swift
//  
//
//  Created by Stanley Rosenbaum on 6/4/21.
//

import Foundation

/**
Heap built using Swift's basic array structure.

The elements can be pretty much anything as long as they conform to the Comparable Protocol

Starting index at 1.   There are two ways to make a heap with arrays.  One starting at the 0-index, and the other starting at the 1-index.

I prefer the 1 index approach, because it lets you reserve the 0-index, if you want to use it for something (like a temporary space).

*/
struct Heap<E: Comparable & Codable>: Codable, JSONDescription {

	// MARK: - Properties

	private var _isMinHeap: Bool
	public var isMinHeap: Bool {
		get {
			return _isMinHeap
		}
	}
	var items = [E?]()
	var count: Int {
		get {
			items.count - 1
		}
	}
	var isEmpty: Bool {
		guard
			!items.isEmpty
		else {
			fatalError("There should always be 1 placeholder item in the Heap storage.")
		}
		return count == 1
	}


	// MARK: - Inits

	init(isMinHeap: Bool = true) {
		_isMinHeap = isMinHeap
		items.append(nil)
	}


	// MARK: - Class Methods

	// MARK: getIndexes()

	private func getParentIndex(_ index: Int) -> Int {
		guard
			index != 0
		else {
			return -1
		}

		return index == 1 ? 1 : index / 2
	}

	private func getLeftChildIndex(_ index: Int) -> Int {
		return 2 * index
	}

	private func getRightChildIndex(_ index: Int) -> Int {
		return 2 * index + 1
	}


	// MARK: hasRelative()

	private func hasParent(_ index: Int) -> Bool {
		guard
			index != 0,
			index != 1
		else {
			return false
		}
		return getParentIndex(index) >= 0
	}

	private func hasLeftChild(_ index: Int) -> Bool {
		guard
			index != 0
		else {
			return false
		}
		return getLeftChildIndex(index) <= count
	}

	private func hasRightChild(_ index: Int) -> Bool {
		guard
			index != 0
		else {
			return false
		}
		return getRightChildIndex(index) <= count
	}


	// MARK: getRelative()

	private func getParent(_ index: Int) -> E? {
		guard
			index != 0,
			index != 1,
			index <= count
		else {
			return nil
		}

		let results = items[getParentIndex(index)]
		return results
	}

	private func getLeftChild(_ index: Int) -> E? {
		let leftChildIndex = getLeftChildIndex(index)
		guard
			index != 0,
			leftChildIndex <= count
		else {
			return nil
		}
		return items[leftChildIndex]
	}

	private func getRightChild(_ index: Int) -> E? {
		let rightChildIndex = getRightChildIndex(index)
		guard
			index != 0,
			rightChildIndex <= count
		else {
			return nil
		}
		return items[rightChildIndex]
	}

	
	// MARK: Heapify()

	private mutating func swap(indexOne: Int, indexTwo: Int) {
		items[0] = items[indexOne]
		items[indexOne] = items[indexTwo]
		items[indexTwo] = items[0]
		items[0] = nil
	}

	private mutating func  minHeapifyUp() {
		var index = count
		while
			isMinHeap,
			let parentElement = getParent(index),
			let addedElment = items[index],
			hasParent(index) && parentElement > addedElment {
			swap(indexOne: getParentIndex(index), indexTwo: index)
			index = getParentIndex(index)
		}
	}


	private mutating func  maxHeapifyUp() {
		var index = count
		while
			!isMinHeap,
			let parentElement = getParent(index),
			let addedElment = items[index],
			hasParent(index) && parentElement < addedElment {
			swap(indexOne: getParentIndex(index), indexTwo: index)
			index = getParentIndex(index)
		}
	}


	private mutating func minHeapifyDown() {
		var index = 1 // We are using 1-index
		while hasLeftChild(index) {
			var smallerChildIndex = getLeftChildIndex(index)
			if
				let leftChild = getLeftChild(index),
				let rightChild = getRightChild(index),
				rightChild < leftChild {
				smallerChildIndex = getRightChildIndex(index)
			}
			if
				let lhs = items[index],
				let rhs = items[smallerChildIndex],
				lhs < rhs {
				break
			} else {
				swap(indexOne: index, indexTwo: smallerChildIndex)
			}

			index = smallerChildIndex
		}
	}

	private mutating func maxHeapifyDown() {
		var index = 1 // We are using 1-index
		while hasLeftChild(index) {
			var smallerChildIndex = getLeftChildIndex(index)
			if
				let leftChild = getLeftChild(index),
				let rightChild = getRightChild(index),
				rightChild > leftChild {
				smallerChildIndex = getRightChildIndex(index)
			}
			if
				let lhs = items[index],
				let rhs = items[smallerChildIndex],
				lhs > rhs {
				break
			} else {
				swap(indexOne: index, indexTwo: smallerChildIndex)
			}

			index = smallerChildIndex
		}
	}


	private mutating func heapifyDown() {
		if isMinHeap {
			minHeapifyDown()
		} else {
			maxHeapifyDown()
		}
	}

	private mutating func heapifyUp() {
		if isMinHeap {
			minHeapifyUp()
		} else {
			maxHeapifyUp()
		}
	}



	// MARK: Publics

	public mutating func push(_ item: E) {
		items.append(item)
		heapifyUp()
	}


	@discardableResult
	mutating public func poll() -> E? {
		if !isEmpty {
			let topItem = items[1]
			let lastItem = items.removeLast()
			items[1] = lastItem
			heapifyDown()
			return topItem
		} else {
			return nil
		}
	}

	public func peak() -> E? {
		guard let heapTop = items[1] else { return nil }
		return heapTop
	}

}



extension Heap: CustomStringConvertible, CustomDebugStringConvertible {
	var debugDescription: String {
		return String(describing: items)
	}

	var description: String {
		return String(describing: items)
	}

	func getDescription() -> String {

		var _ = items.reduce(0) { max(String(describing: $0).count, String(describing: $1).count ) }

		return ""
	}

}




// MARK: - For Unit Tests / Console Debugging

extension Heap {
	/**
	These are public accessors for the private function for the Unit Tests.
	*/
	#if DEBUG

	init(isMinHeap: Bool = true, mockArray: Array<E?> = Array<E?>()) {
		self.init(isMinHeap: isMinHeap)
		let joined = items + mockArray[0...]
		items = joined
	}

	public func testHasParent(_ index: Int) -> Bool {
		return hasParent(index)
	}

	public func testHasLeftChild(_ index: Int) -> Bool {
		return hasLeftChild(index)
	}

	public func testHasRightChild(_ index: Int) -> Bool {
		return hasRightChild(index)
	}

	public func testGetParentIndex(_ index: Int) -> Int {
		return getParentIndex(index)
	}

	public func testGetLeftChildIndex(_ index: Int) -> Int {
		return getLeftChildIndex(index)
	}

	public func testGetRightChildIndex(_ index: Int) -> Int {
		return getRightChildIndex(index)
	}

	public func testGetParent(_ index: Int) -> E? {
		return getParent(index)
	}

	public func testGetLeftChild(_ index: Int) -> E? {
		return getLeftChild(index)
	}

	public func testGetRightChild(_ index: Int) -> E? {
		return getRightChild(index)
	}

	public mutating func testHeapifyUp() -> [E?] {
		heapifyUp()
		return items
	}

	public mutating func testHeapifyDown() -> [E?] {
		heapifyDown()
		return items
	}

	#endif

}

