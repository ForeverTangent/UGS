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

		print(graph.vertexes)

	}


	func testGraphUndirectedBFS_01() {

		let graph = Graph<String>()

		let Z = graph.createVertex(data: "Z")

		let A = graph.createVertex(data: "A")
		let B = graph.createVertex(data: "B")
		let C = graph.createVertex(data: "C")

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

		print(graph.vertexes.sorted(by: { lhs, rhs in
			lhs.index < rhs.index
		}))

		if let results = graph.breadthFirstSearch(forData: Z.data, startingAtVertex: A) {
			print(results)
		}

		if let results = graph.breadthFirstSearch(forData: "A", startingAtVertex: A) {
			print(results)
		}

		if let results = graph.breadthFirstSearch(forData: "B", startingAtVertex: A) {
			print(results)
		}

		if let results = graph.breadthFirstSearch(forData: "C", startingAtVertex: A) {
			print(results)
		}

	}


	func testGraphUndirectedBFS_02() {

		let graph = Graph<String>()

		let Z = graph.createVertex(data: "Z")

		let A = graph.createVertex(data: "A")
		let B = graph.createVertex(data: "B")
		let C = graph.createVertex(data: "C")

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

		print(graph.vertexes.sorted(by: { lhs, rhs in
			lhs.index < rhs.index
		}))

		if let results = graph.breadthFirstSearch(forVertex: Z, startingAtVertex: A) {
			print(results)
		}

		if let results = graph.breadthFirstSearch(forVertex: A, startingAtVertex: A) {
			print(results)
		}

		if let results = graph.breadthFirstSearch(forVertex: B, startingAtVertex: A) {
			print(results)
		}

		if let results = graph.breadthFirstSearch(forVertex: C, startingAtVertex: A) {
			print(results)
		}

	}


}
