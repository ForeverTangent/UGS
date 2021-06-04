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

	func testGetParentIndexes() {

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
	


}
