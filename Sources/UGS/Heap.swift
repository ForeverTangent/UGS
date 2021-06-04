//
//  File.swift
//  
//
//  Created by Stanley Rosenbaum on 6/4/21.
//

import Foundation

/**
Heap built using Swift's basic array structure.

Out first 'class' structure for reasons forth coming.

The elements can be pretty much anything as long as they conform to the Comparable Protocol

Starting index at 1.   There are two ways to make a heap with arrays.  One starting at the 0-index, and the other starting at the 1-index.

I prefer the 1 index approach, because it lets you reserve the 0-index, if you want to use it for something (like a temporary space).

*/
class Heap<E: Comparable> {

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
	var isEmpty: Bool { return count == 0 }


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
		guard
			index != 0
		else {
			return -1
		}
		return 2 * index
	}

	private func getRightChildIndex(_ index: Int) -> Int {
		guard
			index != 0
		else {
			return -1
		}
		return 2 * index + 1
	}


	// MARK: hasRelative()

	private func hasParent(_ index: Int) -> Bool {
		guard
			index != 0
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
		return getLeftChildIndex(index) < count
	}

	private func hasRightChild(_ index: Int) -> Bool {
		guard
			index != 0
		else {
			return false
		}
		return getRightChildIndex(index) < count
	}

	// MARK: getRelative()

	private func getParent(_ index: Int) -> E? {
		guard
			index != 0,
			index < count
		else {
			return nil
		}
		let results = items[getParentIndex(index)]
		return results
	}

	private func getLeftChild(_ index: Int) -> E? {
		guard
			index != 0,
			index < count
		else {
			return nil
		}
		let results = items[getLeftChildIndex(index)]
		return results
	}

	private func getRightChild(_ index: Int) -> E? {
		guard
			index != 0,
			index < count
		else {
			return nil
		}
		let results = items[getRightChildIndex(index)]
		return results
	}

	// MARK: Heapify()

}


// MARK: - For Unit Tests / Console Debugging

extension Heap {
	/**
	These are public accessors for the private function for the Unit Tests.
	*/
	#if DEBUG

	public func testGetParentIndex(_ index: Int) -> Int {
		return getParentIndex(index)
	}

	public func testGetLeftChildIndex(_ index: Int) -> Int {
		return getLeftChildIndex(index)
	}

	public func testGetRightChildIndex(_ index: Int) -> Int {
		return getRightChildIndex(index)
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

	public func testGetParent(_ index: Int) -> E? {
		return getParent(index)
	}

	public func testLeftChild(_ index: Int) -> E? {
		return getLeftChild(index)
	}

	public func testRightChild(_ index: Int) -> E? {
		return getRightChild(index)
	}

	#endif

}

