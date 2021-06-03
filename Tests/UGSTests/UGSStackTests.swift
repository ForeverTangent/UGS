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

		let testStack1 = Stack<Int>()
		testStack1.push(1)
		XCTAssert(testStack1.count() == 1, "testStack1 !contain 1 element")

		var targetNumberOfElements = 0

		targetNumberOfElements = 10
		let testStack2 = Stack<Int>()
		for element in 0..<targetNumberOfElements {
			testStack2.push(element)
		}
		XCTAssert(testStack2.count() == targetNumberOfElements, "testStack2 !contain \(targetNumberOfElements) elements")

		targetNumberOfElements = 100
		let testStack3 = Stack<Int>()
		for element in 0..<targetNumberOfElements {
			testStack3.push(element)
		}
		XCTAssert(testStack3.count() == targetNumberOfElements, "testStack2 !contain \(targetNumberOfElements) elements")

		targetNumberOfElements = 1000
		let testStack4 = Stack<Int>()
		for element in 0..<targetNumberOfElements {
			testStack4.push(element)
		}
		XCTAssert(testStack4.count() == targetNumberOfElements, "testStack2 !contain \(targetNumberOfElements) elements")

		targetNumberOfElements = 1000000
		let testStack5 = Stack<Int>()
		for element in 0..<targetNumberOfElements {
			testStack5.push(element)
		}
		XCTAssert(testStack5.count() == targetNumberOfElements, "testStack2 !contain \(targetNumberOfElements) elements")

	}
}
