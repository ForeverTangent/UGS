//
//  File.swift
//  
//
//  Created by Stanley Rosenbaum on 2/8/22.
//

import Foundation
import XCTest

@testable import UGS

final class UGSGraphTests: XCTestCase {


	func testGraphUndirected00() {

		let graph = Graph<String>()

		let A = graph.createVertex(data: "A")
		let B = graph.createVertex(data: "B")
		let C = graph.createVertex(data: "C")

		graph.add(.undirected, from: A, to: B)
		graph.add(.undirected, from: A, to: C)

		print(graph)
		let testDescription = graph.description
		var target = "{0: A -> [ 1: B, 2: C ]}"
		XCTAssert(testDescription.contains(target), "!debugDescription.contains(\"target")

		target = "{1: B -> [ 0: A ]}"
		XCTAssert(testDescription.contains(target), "!debugDescription.contains(\"target")

		target = "{2: C -> [ 0: A ]}"
		XCTAssert(testDescription.contains(target), "!debugDescription.contains(\"target")

	}

}
