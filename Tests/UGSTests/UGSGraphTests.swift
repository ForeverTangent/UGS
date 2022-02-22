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


	func testGraphUndirectedBFS_00() {
		let graph = Graph<String>()

		let A = graph.createVertex(data: "A")
		let B = graph.createVertex(data: "B")
		let C = graph.createVertex(data: "C")

		graph.add(.undirected, from: A, to: B)
		graph.add(.undirected, from: B, to: C)

		print(graph)
		let testDescription = graph.description
		print(testDescription)

		var count = 0
		graph.bfsForData { vertex in
			print("VISITED: \(vertex) on step \(count)")
			count = count + 1
		}

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

		var count = 0
		var log = ""

		count = 0
		print("Searching for Z")
		if let results = graph.bfsForData(Z.data,
										  startingAtVertex: A,
										  onVisit: { vertex in
			log = log + "VISITED: \(vertex) on step \(count)\n"
			count = count + 1
		}) {
			print(results)
		}

		print(log)
		print("Final Count: \(count)\n")

		log = ""
		count = 0
		print("Searching for A")
		if let results = graph.bfsForData("A",
										  startingAtVertex: A,
										  onVisit: { vertex in
			log = log + "VISITED: \(vertex) on step \(count)\n"
			count = count + 1
		}) {
			print(results)
		}

		print(log)
		print("Final Count: \(count)\n")

		log = ""
		count = 0
		print("Searching for B")
		if let results = graph.bfsForData("B",
										  startingAtVertex: A,
										  onVisit: { vertex in
			log = log + "VISITED: \(vertex) on step \(count)\n"
			count = count + 1
		}) {
			print(results)
		}
		print(log)
		print("Final Count: \(count)\n")


		log = ""
		count = 0
		print("Searching for C")
		if let results = graph.bfsForData("C",
										  startingAtVertex: A,
										  onVisit: { vertex in
			log = log + "VISITED: \(vertex) on step \(count)\n"
			count = count + 1
		}) {
			print(results)
		}
		print(log)
		print("Final Count: \(count)\n")

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

		if let results = graph.bfsForVertex(Z, startingAtVertex: A) {
			print(results)
		}

		if let results = graph.bfsForVertex(A, startingAtVertex: A) {
			print(results)
		}

		if let results = graph.bfsForVertex(B, startingAtVertex: A) {
			print(results)
		}

		if let results = graph.bfsForVertex(C, startingAtVertex: A) {
			print(results)
		}

	}


}
