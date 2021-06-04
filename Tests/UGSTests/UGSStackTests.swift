//
//  File.swift
//  
//
//  Created by Stanley Rosenbaum on 6/3/21.
//

import Foundation
import XCTest

@testable import UGS

final class UGSStackTests: XCTestCase {
	func testStackPush() {
		// This is an example of a functional test case.
		// Use XCTAssert and related functions to verify your tests produce the correct
		// results.

		func testPushWithNumberOfElements(_ number: Int) {
			var testStack = Stack<Int>()
			for element in 0..<number {
				testStack.push(element)
			}
			XCTAssert(testStack.count() == number, "testStack.count() != \(number)")
		}

		var testStack1 = Stack<Int>()
		testStack1.push(1)
		XCTAssert(testStack1.count() == 1, "testStack1 !contain 1 element")

		testPushWithNumberOfElements(10)
		testPushWithNumberOfElements(100)
		testPushWithNumberOfElements(1000)
		testPushWithNumberOfElements(1000000)

	}

	func testStackPop() {
		// This is an example of a functional test case.
		// Use XCTAssert and related functions to verify your tests produce the correct
		// results.

		func testPopWithNumberOfElements(_ number: Int) {
			let poppedElement = number - 1

			var testStack = Stack<Int>()
			for element in 0..<number {
				testStack.push(element)
			}
			guard
				let thePoppedElement = testStack.pop()
			else {
				XCTAssertTrue(false, "Error testStack with \(number), nothign was popped.")
				return
			}
			XCTAssert(thePoppedElement == poppedElement, "thePoppedElement != \(poppedElement)")
			XCTAssert(testStack.count() == poppedElement, "testStack.count() != poppedElement")
		}


		func testPopAllTilEmpTyWithNumberOfElements(_ number: Int) {

			var testStack = Stack<Int>()
			for element in 0..<number {
				testStack.push(element)
			}
			guard
				testStack.pop() != nil
			else {
				XCTAssertTrue(false, "Error testStack with \(number), nothign was popped.")
				return
			}


			for _ in 0..<number {
				_ = testStack.pop()
			}

			XCTAssertTrue(testStack.isEmpty, "!testStack.isEmpty")

		}


		testPopWithNumberOfElements(10)
		testPopWithNumberOfElements(100)
		testPopWithNumberOfElements(1000)
		testPopWithNumberOfElements(1000000)

		testPopAllTilEmpTyWithNumberOfElements(10)
		testPopAllTilEmpTyWithNumberOfElements(100)
		testPopAllTilEmpTyWithNumberOfElements(1000)
		testPopAllTilEmpTyWithNumberOfElements(1000000)

	}

	func testStackPeak() {
		// This is an example of a functional test case.
		// Use XCTAssert and related functions to verify your tests produce the correct
		// results.

		func testPeakWithNumberOfElements(_ number: Int) {
			let peakedElement = number - 2
			let poppedElement = number - 1

			var testStack = Stack<Int>()
			for element in 0..<number {
				testStack.push(element)
			}
			guard
				let thePoppedElement = testStack.pop(),
				let thePeakedElement = testStack.peak()
			else {
				XCTAssertTrue(false, "Error testStack with \(number), nothign was popped.")
				return
			}
			XCTAssert(thePoppedElement == poppedElement, "thePoppedElement != \(poppedElement)")
			XCTAssert(thePeakedElement == peakedElement, "thePeakedElement != \(peakedElement)")
			XCTAssert(testStack.count() == poppedElement, "testStack.count() != poppedElement")
		}


		testPeakWithNumberOfElements(10)
		testPeakWithNumberOfElements(100)
		testPeakWithNumberOfElements(1000)
		testPeakWithNumberOfElements(1000000)

	}

	func testStackEmptyClear() {
		// This is an example of a functional test case.
		// Use XCTAssert and related functions to verify your tests produce the correct
		// results.

		func testEmptyClearWithNumberOfElements(_ number: Int) {
			var testStack = Stack<Int>()
			for element in 0..<number {
				testStack.push(element)
			}
			XCTAssertFalse(testStack.isEmpty, "testStack.isEmpty != false")
			guard
				let _ = testStack.pop()
			else {
				XCTAssertTrue(false, "Error testStack with \(number), nothign was popped.")
				return
			}
			XCTAssertFalse(testStack.isEmpty, "testStack.isEmpty != false")
			testStack.clear()
			XCTAssertTrue(testStack.isEmpty, "testStack.isEmpty != true")
		}

		testEmptyClearWithNumberOfElements(10)
		testEmptyClearWithNumberOfElements(100)
		testEmptyClearWithNumberOfElements(1000)
		testEmptyClearWithNumberOfElements(1000000)


	}

}
