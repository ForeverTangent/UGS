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

		let A = graph.addVertex(data: "A")
		let B = graph.addVertex(data: "B")
		let C = graph.addVertex(data: "C")

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

		print(graph.vertices())

	}


	func testGraphUndirectedBFS_01() {

		let graph = Graph<String>()

		let A = graph.addVertex(data: "A")
		let B = graph.addVertex(data: "B")
		let C = graph.addVertex(data: "C")

		graph.add(.undirected, from: A, to: B)
		graph.add(.undirected, from: B, to: C)

		print(graph)
		let testDescription = graph.description

		var target = "{0: Z -> [  ]}"
		XCTAssert(testDescription.contains(target), "!debugDescription.contains(\"target")

		target = "{1: A -> [ 2: B ]}"
		XCTAssert(testDescription.contains(target), "!debugDescription.contains(\"target")

		target = "{2: B -> [ 1: A, 3: C ]}"
		XCTAssert(testDescription.contains(target), "!debugDescription.contains(\"target")

		target = "{3: C -> [ 2: B ]}"
		XCTAssert(testDescription.contains(target), "!debugDescription.contains(\"target")

		print(graph.vertices().sorted(by: { lhs, rhs in
			lhs.index < rhs.index
		}))

	}


	func testGraphUndirectedBFS_02() {

		let graph = Graph<String>()

		let A = graph.addVertex(data: "A")
		let B = graph.addVertex(data: "B")
		let C = graph.addVertex(data: "C")

		graph.add(.undirected, from: A, to: B)
		graph.add(.undirected, from: B, to: C)

		print(graph)
		let testDescription = graph.description

		var target = "{0: Z -> [  ]}"
		XCTAssert(testDescription.contains(target), "!debugDescription.contains(\"target")

		target = "{1: A -> [ 2: B ]}"
		XCTAssert(testDescription.contains(target), "!debugDescription.contains(\"target")

		target = "{2: B -> [ 1: A, 3: C ]}"
		XCTAssert(testDescription.contains(target), "!debugDescription.contains(\"target")

		target = "{3: C -> [ 2: B ]}"
		XCTAssert(testDescription.contains(target), "!debugDescription.contains(\"target")

	}


}
