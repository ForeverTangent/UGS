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

	func testHeapHasParent() {

		let testHeap = Heap<Int>(mockArray: [1, 2, 3, 4, 5, 6, 7])
		var result = true

		result = testHeap.testHasParent(1)
		XCTAssertFalse(result, "result \(result) != false")

		result = testHeap.testHasParent(2)
		XCTAssertTrue(result, "result \(result) != true")

		result = testHeap.testHasParent(3)
		XCTAssertTrue(result, "result \(result) != true")

		result = testHeap.testHasParent(4)
		XCTAssertTrue(result, "result \(result) != true")

		result = testHeap.testHasParent(5)
		XCTAssertTrue(result, "result \(result) != true")

		result = testHeap.testHasParent(6)
		XCTAssertTrue(result, "result \(result) != true")

		result = testHeap.testHasParent(7)
		XCTAssertTrue(result, "result \(result) != true")

	}

	func testHeapHasLeftChild() {

		let testHeap = Heap<Int>(mockArray: [1, 2, 3, 4, 5, 6, 7])
		var result = true

		result = testHeap.testHasLeftChild(1)
		XCTAssertTrue(result, "result \(result) != true")

		result = testHeap.testHasLeftChild(2)
		XCTAssertTrue(result, "result \(result) != true")

		result = testHeap.testHasLeftChild(3)
		XCTAssertTrue(result, "result \(result) != true")

		result = testHeap.testHasLeftChild(4)
		XCTAssertFalse(result, "result \(result) != false")

		result = testHeap.testHasLeftChild(5)
		XCTAssertFalse(result, "result \(result) != false")

		result = testHeap.testHasLeftChild(6)
		XCTAssertFalse(result, "result \(result) != false")

		result = testHeap.testHasLeftChild(7)
		XCTAssertFalse(result, "result \(result) != false")

	}

	func testHeapHasRightChild() {

		let testHeap = Heap<Int>(mockArray: [1, 2, 3, 4, 5, 6, 7])
		var result = true

		result = testHeap.testHasRightChild(1)
		XCTAssertTrue(result, "result \(result) != true")

		result = testHeap.testHasRightChild(2)
		XCTAssertTrue(result, "result \(result) != true")

		result = testHeap.testHasRightChild(3)
		XCTAssertTrue(result, "result \(result) != true")

		result = testHeap.testHasRightChild(4)
		XCTAssertFalse(result, "result \(result) != false")

		result = testHeap.testHasRightChild(5)
		XCTAssertFalse(result, "result \(result) != false")

		result = testHeap.testHasRightChild(6)
		XCTAssertFalse(result, "result \(result) != false")

		result = testHeap.testHasRightChild(7)
		XCTAssertFalse(result, "result \(result) != false")


	}


	func testHeapGetParentIndexes() {

		let testHeap = Heap<Int>()
		var result = 0

		result = testHeap.testGetParentIndex(0)
		XCTAssert(result == -1, "result != -1")
		result = testHeap.testGetLeftChildIndex(0)
		XCTAssert(result == 0, "result != 0")
		result = testHeap.testGetRightChildIndex(0)
		XCTAssert(result == 1, "result != 0")

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

		result = testHeap.testGetLeftChildIndex(0)
		XCTAssert(result == 0, "result \(result) != 0")

		result = testHeap.testGetRightChildIndex(0)
		XCTAssert(result == 1, "result \(result) != 1")

		result = testHeap.testGetLeftChildIndex(1)
		XCTAssert(result == 2, "result \(result) != 2")

		result = testHeap.testGetRightChildIndex(1)
		XCTAssert(result == 3, "result \(result) != 3")

		result = testHeap.testGetLeftChildIndex(2)
		XCTAssert(result == 4, "result \(result) != 4")

		result = testHeap.testGetRightChildIndex(2)
		XCTAssert(result == 5, "result \(result) != 5")

		result = testHeap.testGetLeftChildIndex(3)
		XCTAssert(result == 6, "result \(result) != 6")

		result = testHeap.testGetRightChildIndex(3)
		XCTAssert(result == 7, "result \(result) != 7")


		result = testHeap.testGetLeftChildIndex(4389129)
		XCTAssert(result == 8778258, "result \(result) != 8778258")

		result = testHeap.testGetRightChildIndex(4389129)
		XCTAssert(result == 8778259, "result \(result) != 8778259")
		
	}


	func testGetParentElements() {
		let testHeap0 = Heap<Int>(mockArray: [1, 2, 3, 4, 5, 6, 7])

		var result: Int? = 0

		result = testHeap0.testGetParent(1)
		XCTAssertNil(result, "result \(String(describing: result)) != nil")

		result = testHeap0.testGetParent(2)
		XCTAssert(result == 1, "result \(String(describing: result)) != 1")

		result = testHeap0.testGetParent(3)
		XCTAssert(result == 1, "result \(String(describing: result)) != 1")

		result = testHeap0.testGetParent(4)
		XCTAssert(result == 2, "result \(String(describing: result)) != 2")

		result = testHeap0.testGetParent(5)
		XCTAssert(result == 2, "result \(String(describing: result)) != 2")

		result = testHeap0.testGetParent(6)
		XCTAssert(result == 3, "result \(String(describing: result)) != 3")

		result = testHeap0.testGetParent(7)
		XCTAssert(result == 3, "result \(String(describing: result)) != 3")

	}


	func testGetChildElements() {
		let testHeap0 = Heap<Int>(mockArray: [1, 2, 3, 4, 5, 6, 7])

		var result: Int? = 0

		result = testHeap0.testGetLeftChild(1)
		XCTAssert(result == 2, "result \(String(describing: result)) != 2")

		result = testHeap0.testGetRightChild(1)
		XCTAssert(result == 3, "result \(String(describing: result)) != 3")

		result = testHeap0.testGetLeftChild(2)
		XCTAssert(result == 4, "result \(String(describing: result)) != 4")

		result = testHeap0.testGetRightChild(2)
		XCTAssert(result == 5, "result \(String(describing: result)) != 5")

		result = testHeap0.testGetLeftChild(3)
		XCTAssert(result == 6, "result \(String(describing: result)) != 6")

		result = testHeap0.testGetRightChild(3)
		XCTAssert(result == 7, "result \(String(describing: result)) \(String(describing: result)) != 7")


		for index in 4...7  {
			result = testHeap0.testGetLeftChild(index)
			XCTAssertNil(result, "index \(index) -> result left child \(String(describing: result)) != nil")

			result = testHeap0.testGetRightChild(index)
			XCTAssertNil(result, "index \(index) -> result right child \(String(describing: result)) != nil")
		}

	}


	

	func testMinHeapifyUp() {

		var theResults: [Int?] = [Int?]()

		func runTestHeapifyUpWith(mockArray: [Int], target: Int = 1) {
			var testHeapMin = Heap<Int>(mockArray: mockArray)
			theResults = testHeapMin.testHeapifyUp()
			if let theResult = theResults[1] {
				XCTAssert(theResult == target, "theResult \(theResult) != \(target)")
			}
		}

		runTestHeapifyUpWith(mockArray: [2, 1])

	}


	func testMaxHeapifyUp() {
		//		var target: [Int?] = [nil]
		var theResults: [Int?] = [Int?]()

		func runTestHeapifyUpWith(mockArray: [Int], target: Int = 1) {
			var testHeapMax = Heap<Int>(isMinHeap: false, mockArray: mockArray)
			theResults = testHeapMax.testHeapifyUp()
			if let theResult = theResults[1] {
				XCTAssert(theResult == target, "theResult \(theResult) != \(target)")
			}
		}

		runTestHeapifyUpWith(mockArray: [1, 2], target: 2)
		runTestHeapifyUpWith(mockArray: [1, 2, 3], target: 3)
		runTestHeapifyUpWith(mockArray: [1, 2, 3, 4], target: 4)
		runTestHeapifyUpWith(mockArray: [1, 2, 3, 4, 5], target: 5)
		runTestHeapifyUpWith(mockArray: [1, 2, 3, 4, 5, 6], target: 6)
		runTestHeapifyUpWith(mockArray: [1, 2, 3, 4, 5, 6, 7], target: 7)

	}


	func testMinHeapifyDown() {

		func getLastHalfOfHeap(mockArray: [Int]) -> [Int] {
			let droppedFirst = mockArray.compactMap{ $0 }
			let start = droppedFirst.count / 2
			let results = Array(droppedFirst[start...])
			return results
		}


		func runTestMinHeapifyDownWith(mockArray: [Int], targetBottom: Int) {

			var testHeapMax = Heap<Int>(mockArray: mockArray)

			let theResults = testHeapMax.testHeapifyDown().compactMap{ $0 }
			guard
				let top = testHeapMax.peak()
			else {
				XCTAssert(false, "No First")
				return
			}
			let theLastHalf = getLastHalfOfHeap(mockArray: theResults)

//			print("R: \(theResults)")
//			print("T: \(top)")
//			print("LH: \(theLastHalf)")

			XCTAssert(top == 1, "top \(top) != 1")
			XCTAssert(theLastHalf.contains(targetBottom), "lastHalfOfResults != contain \(targetBottom)")

		}


		runTestMinHeapifyDownWith(mockArray: [2, 1], targetBottom: 2)
		runTestMinHeapifyDownWith(mockArray: [3, 1, 2], targetBottom: 3)
		runTestMinHeapifyDownWith(mockArray: [3, 2, 1], targetBottom: 3)
		runTestMinHeapifyDownWith(mockArray: [4, 1, 2, 3], targetBottom: 4)
		runTestMinHeapifyDownWith(mockArray: [4, 2, 1, 3], targetBottom: 4)
		runTestMinHeapifyDownWith(mockArray: [5, 1, 2, 3, 4], targetBottom: 5)
		runTestMinHeapifyDownWith(mockArray: [5, 2, 1, 3, 4], targetBottom: 5)
		runTestMinHeapifyDownWith(mockArray: [5, 1, 2, 4, 3], targetBottom: 5)
		runTestMinHeapifyDownWith(mockArray: [5, 2, 1, 4, 3], targetBottom: 5)
		runTestMinHeapifyDownWith(mockArray: [6, 1, 2, 3, 4, 5], targetBottom: 6)
		runTestMinHeapifyDownWith(mockArray: [6, 2, 1, 3, 5, 4], targetBottom: 6)
		runTestMinHeapifyDownWith(mockArray: [6, 1, 2, 5, 3, 4], targetBottom: 6)
		runTestMinHeapifyDownWith(mockArray: [6, 2, 1, 4, 5, 3], targetBottom: 6)
		runTestMinHeapifyDownWith(mockArray: [7, 1, 2, 3, 4, 5, 6], targetBottom: 7)
		runTestMinHeapifyDownWith(mockArray: [7, 2, 1, 3, 4, 5, 6], targetBottom: 7)
		runTestMinHeapifyDownWith(mockArray: [7, 1, 2, 3, 4, 6, 6], targetBottom: 7)
		runTestMinHeapifyDownWith(mockArray: [7, 2, 1, 3, 4, 5, 5], targetBottom: 7)
		runTestMinHeapifyDownWith(mockArray: [7, 1, 2, 4, 3, 5, 6], targetBottom: 7)
		runTestMinHeapifyDownWith(mockArray: [7, 2, 1, 4, 3, 6, 5], targetBottom: 7)
		runTestMinHeapifyDownWith(mockArray: [7, 1, 2, 4, 3, 5, 6], targetBottom: 7)
		runTestMinHeapifyDownWith(mockArray: [7, 2, 1, 4, 3, 6, 5], targetBottom: 7)

	}

	func testMaxHeapifyDown() {
		func getLastHalfOfHeap(mockArray: [Int]) -> [Int] {
			let droppedFirst = mockArray.compactMap{ $0 }
			let start = droppedFirst.count / 2
			let results = Array(droppedFirst[start...])
			return results
		}

		func runTestMaxHeapifyDownWith(mockArray: [Int], targetTop: Int, targetBottom: Int) {
			var testHeapMax = Heap<Int>(isMinHeap: false, mockArray: mockArray)
			let theResults = testHeapMax.testHeapifyDown().compactMap{ $0 }
			guard
				let top = testHeapMax.peak()
			else {
				XCTAssert(false, "No First")
				return
			}
			let theLastHalf = getLastHalfOfHeap(mockArray: theResults)


			XCTAssert(top == targetTop, "top \(top) != targetTop \(targetTop)")
			XCTAssert(theLastHalf.contains(targetBottom), "lastHalfOfResults != contain \(targetBottom)")

		}

		runTestMaxHeapifyDownWith(mockArray: [1, 2], targetTop: 2, targetBottom: 1)
		runTestMaxHeapifyDownWith(mockArray: [1, 2, 3], targetTop: 3, targetBottom: 1)
		runTestMaxHeapifyDownWith(mockArray: [1, 3, 2], targetTop: 3, targetBottom: 1)
		runTestMaxHeapifyDownWith(mockArray: [1, 4, 3, 2], targetTop: 4, targetBottom: 1)
		runTestMaxHeapifyDownWith(mockArray: [1, 3, 4, 2], targetTop: 4, targetBottom: 1)
		runTestMaxHeapifyDownWith(mockArray: [1, 5, 4, 3, 2], targetTop: 5, targetBottom: 1)
		runTestMaxHeapifyDownWith(mockArray: [1, 4, 5, 3, 2], targetTop: 5, targetBottom: 1)
		runTestMaxHeapifyDownWith(mockArray: [1, 5, 4, 2, 3], targetTop: 5, targetBottom: 1)
		runTestMaxHeapifyDownWith(mockArray: [1, 4, 5, 2, 3], targetTop: 5, targetBottom: 1)
		runTestMaxHeapifyDownWith(mockArray: [1, 6, 5, 4, 3, 2], targetTop: 6, targetBottom: 1)
		runTestMaxHeapifyDownWith(mockArray: [1, 5, 6, 4, 3, 2], targetTop: 6, targetBottom: 1)
		runTestMaxHeapifyDownWith(mockArray: [1, 6, 5, 3, 2, 4], targetTop: 6, targetBottom: 1)
		runTestMaxHeapifyDownWith(mockArray: [1, 5, 6, 3, 2, 4], targetTop: 6, targetBottom: 1)
		runTestMaxHeapifyDownWith(mockArray: [1, 6, 5, 2, 4, 3], targetTop: 6, targetBottom: 1)
		runTestMaxHeapifyDownWith(mockArray: [1, 5, 6, 2, 4, 3], targetTop: 6, targetBottom: 1)
		runTestMaxHeapifyDownWith(mockArray: [1, 7, 6, 5, 4, 3, 2], targetTop: 7, targetBottom: 1)
		runTestMaxHeapifyDownWith(mockArray: [1, 6, 7, 5, 4, 3, 2], targetTop: 7, targetBottom: 1)
		runTestMaxHeapifyDownWith(mockArray: [1, 7, 6, 4, 5, 3, 2], targetTop: 7, targetBottom: 1)
		runTestMaxHeapifyDownWith(mockArray: [1, 6, 7, 4, 5, 3, 2], targetTop: 7, targetBottom: 1)
		runTestMaxHeapifyDownWith(mockArray: [1, 7, 6, 5, 4, 2, 3], targetTop: 7, targetBottom: 1)
		runTestMaxHeapifyDownWith(mockArray: [1, 6, 7, 5, 4, 2, 3], targetTop: 7, targetBottom: 1)
		runTestMaxHeapifyDownWith(mockArray: [1, 7, 6, 4, 5, 2, 3], targetTop: 7, targetBottom: 1)
		runTestMaxHeapifyDownWith(mockArray: [1, 6, 7, 4, 5, 2, 3], targetTop: 7, targetBottom: 1)

	}


	func testMinHeapPush_01() {

		var testMinHeap = Heap<Int>()

		testMinHeap.push(6)
		testMinHeap.push(3)
		testMinHeap.push(1)
		testMinHeap.push(2)
		testMinHeap.push(7)
		testMinHeap.push(4)
		testMinHeap.push(5)

		print(testMinHeap.items.compactMap{ $0 })

		XCTAssert(testMinHeap.peak() == 1, "testMinHeap.top != 1")

	}


	func testMinHeapPush_02() {

		var testMinHeap = Heap<Int>()

		var randomArray = [Int]()

		for _ in 2...1000 {
			let newElement = Int.random(in: 2...1000)
			randomArray.append(newElement)
		}

		for element in randomArray {
			testMinHeap.push(element)
		}

		testMinHeap.push(1)

		XCTAssert(testMinHeap.peak() == 1, "testMinHeap.top != 1")

	}



	func testMinHeapPoll_01() {

		var testMinHeap = Heap<Int>()

		testMinHeap.push(6)
		testMinHeap.push(3)
		testMinHeap.push(1)
		testMinHeap.push(2)
		testMinHeap.push(7)
		testMinHeap.push(4)
		testMinHeap.push(5)

		testMinHeap.poll()
		testMinHeap.poll()
		testMinHeap.poll()

		print(testMinHeap.items.compactMap{ $0 })

		XCTAssert(testMinHeap.peak() == 4, "testMinHeap.top != 4")

	}

	func testMinHeapPoll_02() {

		var testMinHeap = Heap<Int>()

		let randomArray = Array(2...1000).shuffled()

		for element in randomArray {
			testMinHeap.push(element)
		}

		testMinHeap.push(1)

		for _ in 1...50 {
			testMinHeap.poll()
		}

		XCTAssert(testMinHeap.peak() == 51, "testMinHeap.top != 51")

	}




}
