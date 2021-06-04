//
//  File.swift
//  
//
//  Created by Stanley Rosenbaum on 6/4/21.
//

import Foundation
import XCTest

@testable import UGS

final class UGSQueueTests: XCTestCase {
	func testQueuePush() {
		// This is an example of a functional test case.
		// Use XCTAssert and related functions to verify your tests produce the correct
		// results.

		func testPushWithNumberOfElements(_ number: Int) {
			var testQueue = Queue<Int>()
			for element in 0..<number {
				testQueue.push(element)
			}
			XCTAssert(testQueue.count() == number, "testQueue.count() != \(number)")
		}

		var testQueue1 = Queue<Int>()
		testQueue1.push(1)
		XCTAssert(testQueue1.count() == 1, "testQueue1 !contain 1 element")

		testPushWithNumberOfElements(10)
		testPushWithNumberOfElements(100)
		testPushWithNumberOfElements(1000)
		testPushWithNumberOfElements(1000000)

	}

	func testQueuePop() {
		// This is an example of a functional test case.
		// Use XCTAssert and related functions to verify your tests produce the correct
		// results.

		func testPopWithNumberOfElements(_ number: Int) {
			let poppedElement = 0

			var testQueue = Queue<Int>()
			for element in 0..<number {
				testQueue.push(element)
			}
			guard
				let thePoppedElement = testQueue.pop()
			else {
				XCTAssertTrue(false, "Error testQueue with \(number), nothign was popped.")
				return
			}
			XCTAssert(thePoppedElement == poppedElement, "thePoppedElement != \(poppedElement)")
			XCTAssert(testQueue.count() == number - 1, "testQueue.count() != \(number - 1)")
		}


		func testPopAllTilEmpTyWithNumberOfElements(_ number: Int) {

			var testQueue = Queue<Int>()
			for element in 0..<number {
				testQueue.push(element)
			}
			guard
				testQueue.pop() != nil
			else {
				XCTAssertTrue(false, "Error testQueue with \(number), nothign was popped.")
				return
			}


			for _ in 0..<number {
				_ = testQueue.pop()
			}

			XCTAssertTrue(testQueue.isEmpty, "!testQueue.isEmpty")

		}


		testPopWithNumberOfElements(10)
		testPopWithNumberOfElements(100)
		testPopWithNumberOfElements(1000)


		testPopAllTilEmpTyWithNumberOfElements(10)
		testPopAllTilEmpTyWithNumberOfElements(100)
		testPopAllTilEmpTyWithNumberOfElements(1000)

	}

	func testQueuePeak() {
		// This is an example of a functional test case.
		// Use XCTAssert and related functions to verify your tests produce the correct
		// results.

		func testPeakWithNumberOfElements(_ number: Int) {
			let peakedElement = 1
			let poppedElement = 0

			var testQueue = Queue<Int>()
			for element in 0..<number {
				testQueue.push(element)
			}
			guard
				let thePoppedElement = testQueue.pop(),
				let thePeakedElement = testQueue.peak()
			else {
				XCTAssertTrue(false, "Error testQueue with \(number), nothign was popped.")
				return
			}
			XCTAssert(thePoppedElement == poppedElement, "thePoppedElement != \(poppedElement)")
			XCTAssert(thePeakedElement == peakedElement, "thePeakedElement != \(peakedElement)")
			XCTAssert(testQueue.count() == number - 1, "\(testQueue.count()) != \(number - 2)")
		}


		func testPopAllButOneToPeakAtWithNumberOfElements(_ number: Int) {

			var testQueue = Queue<Int>()
			for element in 0..<number {
				testQueue.push(element)
			}

			for _ in 0..<number - 1 {
				_ = testQueue.pop()
			}

			guard
				let thePeakedElement = testQueue.peak()
			else {
				XCTAssertTrue(false, "Error testQueue with \(number), nothing to peak at.")
				return
			}
			XCTAssert(thePeakedElement == number - 1, "\(thePeakedElement) != \(number - 1)")
			XCTAssert(testQueue.count() == 1, "\(testQueue.count()) != 1")
		}


		testPeakWithNumberOfElements(10)
		testPeakWithNumberOfElements(100)
		testPeakWithNumberOfElements(1000)

		testPopAllButOneToPeakAtWithNumberOfElements(10)
		testPopAllButOneToPeakAtWithNumberOfElements(100)
		testPopAllButOneToPeakAtWithNumberOfElements(1000)

	}

	func testQueueEmptyClear() {
		// This is an example of a functional test case.
		// Use XCTAssert and related functions to verify your tests produce the correct
		// results.

		func testEmptyClearWithNumberOfElements(_ number: Int) {
			var testQueue = Queue<Int>()
			for element in 0..<number {
				testQueue.push(element)
			}
			XCTAssertFalse(testQueue.isEmpty, "testQueue.isEmpty != false")
			guard
				let _ = testQueue.pop()
			else {
				XCTAssertTrue(false, "Error testQueue with \(number), nothign was popped.")
				return
			}
			XCTAssertFalse(testQueue.isEmpty, "testQueue.isEmpty != false")
			testQueue.clear()
			XCTAssertTrue(testQueue.isEmpty, "testQueue.isEmpty != true")
		}

		testEmptyClearWithNumberOfElements(10)
		testEmptyClearWithNumberOfElements(100)
		testEmptyClearWithNumberOfElements(1000)
		testEmptyClearWithNumberOfElements(1000000)

	}
}
