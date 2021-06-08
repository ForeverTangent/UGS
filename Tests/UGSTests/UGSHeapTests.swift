//
//  File.swift
//  
//
//  Created by Stanley Rosenbaum on 6/4/21.
//


import Foundation
import XCTest

@testable import UGS

final class UGSHeapTests: XCTestCase {

	func testHeapGetParentIndexes() {

		let testHeap = Heap<Int>()
		var result = 0

		result = testHeap.testGetParentIndex(0)
		XCTAssert(result == -1, "result != -1")
		result = testHeap.testGetLeftChildIndex(0)
		XCTAssert(result == -1, "result != -1")
		result = testHeap.testGetRightChildIndex(0)
		XCTAssert(result == -1, "result != -1")

		result = testHeap.testGetParentIndex(1)
		XCTAssert(result == 1, "result \(result) != 1")
		result = testHeap.testGetParentIndex(2)
		XCTAssert(result == 1, "result \(result) != 1")
		result = testHeap.testGetParentIndex(3)
		XCTAssert(result == 1, "result \(result) != 1")

		result = testHeap.testGetParentIndex(4)
		XCTAssert(result == 2, "result \(result) != 2")
		result = testHeap.testGetParentIndex(5)
		XCTAssert(result == 2, "result \(result) != 2")

		result = testHeap.testGetParentIndex(6)
		XCTAssert(result == 3, "result \(result) != 3")
		result = testHeap.testGetParentIndex(7)
		XCTAssert(result == 3, "result \(result) != 3")

		result = testHeap.testGetParentIndex(8)
		XCTAssert(result == 4, "result \(result) != 4")
		result = testHeap.testGetParentIndex(9)
		XCTAssert(result == 4, "result \(result) != 4")

		result = testHeap.testGetParentIndex(10)
		XCTAssert(result == 5, "result \(result) != 5")
		result = testHeap.testGetParentIndex(11)
		XCTAssert(result == 5, "result \(result) != 5")

		result = testHeap.testGetParentIndex(12)
		XCTAssert(result == 6, "result \(result) != 6")
		result = testHeap.testGetParentIndex(13)
		XCTAssert(result == 6, "result \(result) != 6")

		result = testHeap.testGetParentIndex(14)
		XCTAssert(result == 7, "result \(result) != 7")
		result = testHeap.testGetParentIndex(15)
		XCTAssert(result == 7, "result \(result) != 7")


		result = testHeap.testGetParentIndex(4389129)
		XCTAssert(result == 2194564, "result \(result) != 2194564")

	}


	func testGetChildIndexes() {

		let testHeap = Heap<Int>()
		var result = 0

		
	}


	func testGetParentElements() {
		let testHeap0 = Heap<Int>(mockArray: [1, 2, 3, 4, 5, 6, 7])
		print(testHeap0)

		var result: Int? = 0

		result = testHeap0.testGetParent(1)
		XCTAssertNil(result, "result \(String(describing: result)) != nil")
		print(result as Any)

		result = testHeap0.testGetParent(2)
		XCTAssert(result == 1, "result \(String(describing: result)) != 1")
		print(result as Any)

		result = testHeap0.testGetParent(3)
		XCTAssert(result == 1, "result \(String(describing: result)) != 1")
		print(result as Any)

		result = testHeap0.testGetParent(4)
		XCTAssert(result == 2, "result \(String(describing: result)) != 2")
		print(result as Any)

		result = testHeap0.testGetParent(5)
		XCTAssert(result == 2, "result \(String(describing: result)) != 2")
		print(result as Any)

		result = testHeap0.testGetParent(6)
		XCTAssert(result == 3, "result \(String(describing: result)) != 3")
		print(result as Any)

		result = testHeap0.testGetParent(7)
		XCTAssert(result == 3, "result \(String(describing: result)) != 3")
		print(result as Any)

	}


	func testGetChildElements() {
		let testHeap0 = Heap<Int>(mockArray: [1, 2, 3, 4, 5, 6, 7])
		print(testHeap0)

		var result: Int? = 0

		result = testHeap0.testGetLeftChild(1)
		XCTAssert(result == 2, "result \(String(describing: result)) != 2")
		print(result as Any)

		result = testHeap0.testGetRightChild(1)
		XCTAssert(result == 3, "result \(String(describing: result)) != 3")
		print(result as Any)

		result = testHeap0.testGetLeftChild(2)
		XCTAssert(result == 4, "result \(String(describing: result)) != 4")
		print(result as Any)

		result = testHeap0.testGetRightChild(2)
		XCTAssert(result == 5, "result \(String(describing: result)) != 5")
		print(result as Any)

		result = testHeap0.testGetLeftChild(3)
		XCTAssert(result == 6, "result \(String(describing: result)) != 6")
		print(result as Any)

		result = testHeap0.testGetRightChild(3)
		XCTAssert(result == 7, "result \(String(describing: result)) \(String(describing: result)) != 7")
		print(result as Any)


		for index in 4...7  {
			result = testHeap0.testGetLeftChild(index)
			XCTAssertNil(result, "index \(index) -> result left child \(String(describing: result)) != nil")
			print(result as Any)

			result = testHeap0.testGetRightChild(index)
			XCTAssertNil(result, "index \(index) -> result right child \(String(describing: result)) != nil")
			print(result as Any)
		}

//		result = testHeap0.testGetParent(2)
//		XCTAssert(result == 1, "result \(String(describing: result)) != 1")
//		print(result as Any)
//
//		result = testHeap0.testGetParent(3)
//		XCTAssert(result == 1, "result \(String(describing: result)) != 1")
//		print(result as Any)
//
//		result = testHeap0.testGetParent(4)
//		XCTAssert(result == 2, "result \(String(describing: result)) != 2")
//		print(result as Any)
//
//		result = testHeap0.testGetParent(5)
//		XCTAssert(result == 2, "result \(String(describing: result)) != 2")
//		print(result as Any)
//
//		result = testHeap0.testGetParent(6)
//		XCTAssert(result == 3, "result \(String(describing: result)) != 3")
//		print(result as Any)
//
//		result = testHeap0.testGetParent(7)
//		XCTAssert(result == 3, "result \(String(describing: result)) != 3")
//		print(result as Any)

	}




	func testHeapAdd() {

//		let testHeap0 = Heap<Int>(mockArray: [1])
//		print(testHeap0)
//
//		let testHeap1 = Heap<Int>()
//		print(testHeap1)
//
//		testHeap1.add(3)
//		print(testHeap1)
//
//		testHeap1.add(2)
//		print(testHeap1)
//
//		testHeap1.add(1)
//		print(testHeap1)
//
//
//		let testHeap2 = Heap<Int>(mockArray: [2, 1])
//		let results = testHeap2.testHeapifyUp()
//		print(results)

	}



}
