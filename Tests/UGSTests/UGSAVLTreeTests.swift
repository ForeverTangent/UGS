//
//  File.swift
//  
//
//  Created by Stanley Rosenbaum on 6/30/21.
//

import Foundation
import XCTest

@testable import UGS

final class UGSAVLTreeTests: XCTestCase {

	func testAVLNode0() {

		let avlNode = AVLNode(data: 5)

		let debugDescription = avlNode.debugDescription
		XCTAssert(debugDescription == "V:5<LC:[  ]-LR:[  ]>", "\(description) != V:5<LC:[  ]-LR:[  ]>")
		print(avlNode.description)

	}

	func testAVLNode1() {

		let avlNode = AVLNode(data: 5)
		let avlNodeLeft = AVLNode(data: 3)
		let avlNodeRight = AVLNode(data: 7)

		avlNode.left = avlNodeLeft
		avlNode.right = avlNodeRight

		let debugDescription = avlNode.debugDescription
		XCTAssert(debugDescription == "V:5<LC:[ V:3<LC:[  ]-LR:[  ]> ]-LR:[ V:7<LC:[  ]-LR:[  ]> ]>",
				  "\(debugDescription) != V:5<LC:[ V:3<LC:[  ]-LR:[  ]> ]-LR:[ V:7<LC:[  ]-LR:[  ]> ]>")
		print(avlNode.description)

	}

	func testAVLNode2() {

		let avlNode = AVLNode(data: 5)
		let avlNodeLeft = AVLNode(data: 3)
		let avlNodeRight = AVLNode(data: 7)

		let avlNodeLeft1 = AVLNode(data: 2)
		let avlNodeRight1 = AVLNode(data: 4)
		let avlNodeLeft2 = AVLNode(data: 6)
		let avlNodeRight2 = AVLNode(data: 8)

		avlNode.left = avlNodeLeft
		avlNode.right = avlNodeRight

		avlNodeLeft.left = avlNodeLeft1
		avlNodeLeft.right = avlNodeRight1

		avlNodeRight.left = avlNodeLeft2
		avlNodeRight.right = avlNodeRight2

		let debugDescription = avlNode.debugDescription
		XCTAssert(debugDescription == "V:5<LC:[ V:3<LC:[ V:2<LC:[  ]-LR:[  ]> ]-LR:[ V:4<LC:[  ]-LR:[  ]> ]> ]-LR:[ V:7<LC:[ V:6<LC:[  ]-LR:[  ]> ]-LR:[ V:8<LC:[  ]-LR:[  ]> ]> ]>",
				  "\(debugDescription) != V:5<LC:[ V:3<LC:[ V:2<LC:[  ]-LR:[  ]> ]-LR:[ V:4<LC:[  ]-LR:[  ]> ]> ]-LR:[ V:7<LC:[ V:6<LC:[  ]-LR:[  ]> ]-LR:[ V:8<LC:[  ]-LR:[  ]> ]> ]>")
		print(avlNode.description)
	}


	func testAVLTree0() {
		let avlTree = AVLTree<Int>()
		avlTree.insert(5)
		print(avlTree)
		XCTAssert(avlTree.debugDescription == "V:5<LC:[  ]-LR:[  ]>",
				  "\(avlTree.debugDescription) != V:5<LC:[  ]-LR:[  ]>")
		print("HEIGHT: \(avlTree.height)\n")
		XCTAssert(avlTree.height == 1, "\(avlTree.height) != 1")

	}


	func testAVLTreeInsertLeft1() {
		let avlTree = AVLTree<Int>()
		avlTree.insert(5)
		print(avlTree)
		XCTAssert(avlTree.debugDescription == "V:5<LC:[  ]-LR:[  ]>",
				  "\(avlTree.debugDescription) != V:5<LC:[  ]-LR:[  ]>")
		print("HEIGHT: \(avlTree.height)\n")
		XCTAssert(avlTree.height == 1, "\(avlTree.height) != 1")

		avlTree.insert(3)
		XCTAssert(avlTree.debugDescription == "V:5<LC:[ V:3<LC:[  ]-LR:[  ]> ]-LR:[  ]>",
				  "\(avlTree.debugDescription) != V:5<LC:[ V:3<LC:[  ]-LR:[  ]> ]-LR:[  ]>")
		print("\(avlTree.debugDescription)\n")
		print("HEIGHT: \(avlTree.height)\n")
		XCTAssert(avlTree.height == 2, "\(avlTree.height) != 1")

	}

	func testAVLTreeInsertRight1() {
		let avlTree = AVLTree<Int>()
		avlTree.insert(5)
		print(avlTree)
		XCTAssert(avlTree.debugDescription == "V:5<LC:[  ]-LR:[  ]>",
				  "\(avlTree.debugDescription) != V:5<LC:[  ]-LR:[  ]>")
		print("HEIGHT: \(avlTree.height)\n")
		XCTAssert(avlTree.height == 1, "\(avlTree.height) != 1")

		avlTree.insert(7)
		XCTAssert(avlTree.debugDescription == "V:5<LC:[  ]-LR:[ V:7<LC:[  ]-LR:[  ]> ]>",
				  "\(avlTree.debugDescription) != V:5<LC:[  ]-LR:[ V:7<LC:[  ]-LR:[  ]> ]>")
		print("\(avlTree.debugDescription)\n")
		print("HEIGHT: \(avlTree.height)\n")
		XCTAssert(avlTree.height == 2, "\(avlTree.height) != 1")

	}

	func testAVLTreeInsertLeftLeft1() {
		let avlTree = AVLTree<Int>()
		avlTree.insert(5)
		print(avlTree)
		XCTAssert(avlTree.debugDescription == "V:5<LC:[  ]-LR:[  ]>",
				  "\(avlTree.debugDescription) != V:5<LC:[  ]-LR:[  ]>")
		print("HEIGHT: \(avlTree.height)\n")
		XCTAssert(avlTree.height == 1, "\(avlTree.height) != 1")

		avlTree.insert(3)
		print("\(avlTree.debugDescription)\n")
		print("HEIGHT: \(avlTree.height)\n")
		XCTAssert(avlTree.height == 2, "\(avlTree.height) != 1")

		avlTree.insert(1)
		XCTAssert(avlTree.debugDescription == "V:5<LC:[ V:3<LC:[ V:1<LC:[  ]-LR:[  ]> ]-LR:[  ]> ]-LR:[  ]>",
				  "\(avlTree.debugDescription) != V:5<LC:[ V:3<LC:[ V:1<LC:[  ]-LR:[  ]> ]-LR:[  ]> ]-LR:[  ]>")
		print("\(avlTree.debugDescription)\n")
		print("HEIGHT: \(avlTree.height)\n")
		XCTAssert(avlTree.height == 3, "\(avlTree.height) != 1")

	}

	func testAVLTreeInsertLeftRight1() {
		let avlTree = AVLTree<Int>()
		avlTree.insert(5)
		print(avlTree)
		XCTAssert(avlTree.debugDescription == "V:5<LC:[  ]-LR:[  ]>",
				  "\(avlTree.debugDescription) != V:5<LC:[  ]-LR:[  ]>")
		print("HEIGHT: \(avlTree.height)\n")
		XCTAssert(avlTree.height == 1, "\(avlTree.height) != 1")

		avlTree.insert(3)
		print("\(avlTree.debugDescription)\n")
		print("HEIGHT: \(avlTree.height)\n")
		XCTAssert(avlTree.height == 2, "\(avlTree.height) != 1")

		avlTree.insert(4)
		XCTAssert(avlTree.debugDescription == "V:5<LC:[ V:3<LC:[  ]-LR:[ V:4<LC:[  ]-LR:[  ]> ]> ]-LR:[  ]>",
				  "\(avlTree.debugDescription) != V:5<LC:[ V:3<LC:[  ]-LR:[ V:4<LC:[  ]-LR:[  ]> ]> ]-LR:[  ]>")
		print("\(avlTree.debugDescription)\n")
		print("HEIGHT: \(avlTree.height)\n")
		XCTAssert(avlTree.height == 3, "\(avlTree.height) != 1")

	}



	func testAVLTreeIntsert1() {
		let avlTree = AVLTree<Int>()
		avlTree.insert(5)
		avlTree.insert(3)
		avlTree.insert(4)
		avlTree.insert(2)
		avlTree.insert(7)
		avlTree.insert(6)
		avlTree.insert(8)

		let debugDescription = avlTree.debugDescription
		XCTAssert(debugDescription == "V:5<LC:[ V:3<LC:[ V:2<LC:[  ]-LR:[  ]> ]-LR:[ V:4<LC:[  ]-LR:[  ]> ]> ]-LR:[ V:7<LC:[ V:6<LC:[  ]-LR:[  ]> ]-LR:[ V:8<LC:[  ]-LR:[  ]> ]> ]>",
				  "\(debugDescription) != V:5<LC:[ V:3<LC:[ V:2<LC:[  ]-LR:[  ]> ]-LR:[ V:4<LC:[  ]-LR:[  ]> ]> ]-LR:[ V:7<LC:[ V:6<LC:[  ]-LR:[  ]> ]-LR:[ V:8<LC:[  ]-LR:[  ]> ]> ]>")
		print(avlTree.description)

	}



	func testAVLTreeMin() {
		let avlTree = AVLTree<Int>()
		avlTree.insert(5)
		avlTree.insert(3)
		avlTree.insert(4)
		avlTree.insert(2)
		avlTree.insert(7)
		avlTree.insert(6)
		avlTree.insert(8)

		let min = avlTree.getMinimum()
		XCTAssert(min == 2, "\(String(describing: min)) != 2")

	}

	func testAVLTreeMax() {
		let avlTree = AVLTree<Int>()
		avlTree.insert(5)
		avlTree.insert(3)
		avlTree.insert(4)
		avlTree.insert(2)
		avlTree.insert(7)
		avlTree.insert(6)
		avlTree.insert(8)

		let max = avlTree.getMaximum()
		XCTAssert(max == 8, "\(String(describing: max)) != 8")

	}


	func testAVLInOrderDebug() {
		let avlTree = AVLTree<Int>()
		avlTree.insert(5)
		avlTree.insert(3)
		avlTree.insert(4)
		avlTree.insert(2)
		avlTree.insert(7)
		avlTree.insert(6)
		avlTree.insert(8)

		let debug = avlTree.getDebugOfAllInOrder()
		let target = "|2|3|4|5|6|7|8|"
		XCTAssert(debug == target, "\(debug) != \(target)")

	}

	func testAVLPostOrderDebug() {
		let avlTree = AVLTree<Int>()
		avlTree.insert(5)
		avlTree.insert(3)
		avlTree.insert(4)
		avlTree.insert(2)
		avlTree.insert(7)
		avlTree.insert(6)
		avlTree.insert(8)

		let debug = avlTree.getDebugOfAllPostOrder()
		let target = "|8|7|6|5|4|3|2|"
		XCTAssert(debug == target, "\(debug) != \(target)")

	}


	func testBalanceFactor() {

		let avlTree = AVLTree<Int>()
		var results = 0

		func checkRootBalanceTarget(_ target: Int) {
			if let root = avlTree.testRoot {
				results = avlTree.testGetBalanceFactorOfNode(root)
				XCTAssert(results == target, "\(results) == \(target)")
			}
		}

		avlTree.insert(5)
		checkRootBalanceTarget(0)

		guard let root = avlTree.testRoot else { return }

		avlTree.insert(3)
		checkRootBalanceTarget(1)
		results = avlTree.testGetBalanceFactorOfNode(root.left!)
		XCTAssert(results == 0, "\(results) == 0")

		avlTree.insert(4)
		checkRootBalanceTarget(2)
		results = avlTree.testGetBalanceFactorOfNode(root.left!)
		XCTAssert(results == 1, "\(results) == 1")
		results = avlTree.testGetBalanceFactorOfNode(root.left!.right!)
		XCTAssert(results == 0, "\(results) == 0")

		avlTree.insert(2)
		checkRootBalanceTarget(2)
		results = avlTree.testGetBalanceFactorOfNode(root.left!)
		XCTAssert(results == 0, "\(results) == 0")
		results = avlTree.testGetBalanceFactorOfNode(root.left!.left!)
		XCTAssert(results == 0, "\(results) == 0")

		avlTree.insert(7)
		checkRootBalanceTarget(1)
		results = avlTree.testGetBalanceFactorOfNode(root.right!)
		XCTAssert(results == 0, "\(results) == 0")

		avlTree.insert(6)
		checkRootBalanceTarget(0)
		results = avlTree.testGetBalanceFactorOfNode(root.right!)
		XCTAssert(results == 1, "\(results) == 1")
		results = avlTree.testGetBalanceFactorOfNode(root.right!.left!)
		XCTAssert(results == 0, "\(results) == 0")

		avlTree.insert(8)
		checkRootBalanceTarget(0)
		results = avlTree.testGetBalanceFactorOfNode(root.right!)
		XCTAssert(results == 0, "\(results) == 0")
		results = avlTree.testGetBalanceFactorOfNode(root.right!.right!)
		XCTAssert(results == 0, "\(results) == 0")
		

	}


	func testRotateRight1() {

		let avlTree = AVLTree<Int>()

		let avlNode = AVLNode(data: 5)
		let avlNodeLeft = AVLNode(data: 3)
		let avlNodeLeftRight = AVLNode(data: 4)
		let avlNodeLeftLeft = AVLNode(data: 2)

		avlNode.left = avlNodeLeft
		avlNode.left?.right = avlNodeLeftRight
		avlNode.left?.left = avlNodeLeftLeft

		avlTree.testRoot = avlNode

		avlTree.testRoot = avlTree.testRotateRight(avlTree.testRoot!)

		let target = "V:3<LC:[ V:2<LC:[  ]-LR:[  ]> ]-LR:[ V:5<LC:[ V:4<LC:[  ]-LR:[  ]> ]-LR:[  ]> ]>"
		let result = avlTree.debugDescription
		XCTAssert(result == target, "\(result) != \(target)")


	}


	func testRotateRight2() {

		let avlTree = AVLTree<Int>()

		let avlNode = AVLNode(data: 5)
		let avlNodeLeft = AVLNode(data: 3)
		let avlNodeLeftLeft = AVLNode(data: 2)

		avlNode.left = avlNodeLeft
		avlNode.left?.left = avlNodeLeftLeft

		avlTree.testRoot = avlNode

		avlTree.testRoot = avlTree.testRotateRight(avlTree.testRoot!)

//		print(avlTree.debugDescription)
		let target = "V:3<LC:[ V:2<LC:[  ]-LR:[  ]> ]-LR:[ V:5<LC:[  ]-LR:[  ]> ]>"
		let result = avlTree.debugDescription
		XCTAssert(result == target, "\(result) != \(target)")

	}


	func testRotateLeft1() {

		let avlTree = AVLTree<Int>()

		let avlNode = AVLNode(data: 5)
		let avlNodeRight = AVLNode(data: 7)
		let avlNodeRightLeft = AVLNode(data: 6)
		let avlNodeRightRight = AVLNode(data: 8)

		avlNode.right = avlNodeRight
		avlNode.right?.left = avlNodeRightLeft
		avlNode.right?.right = avlNodeRightRight

		avlTree.testRoot = avlNode

		avlTree.testRoot = avlTree.testRotateLeft(avlTree.testRoot!)

//		print(avlTree.debugDescription)
		let target = "V:7<LC:[ V:5<LC:[  ]-LR:[ V:6<LC:[  ]-LR:[  ]> ]> ]-LR:[ V:8<LC:[  ]-LR:[  ]> ]>"
		let result = avlTree.debugDescription
		XCTAssert(result == target, "\(result) != \(target)")


	}


	func testRotateLeft2() {

		let avlTree = AVLTree<Int>()

		let avlNode = AVLNode(data: 5)
		let avlNodeRight = AVLNode(data: 7)
		let avlNodeRightRight = AVLNode(data: 8)

		avlNode.right = avlNodeRight
		avlNode.right?.right = avlNodeRightRight

		avlTree.testRoot = avlNode

		avlTree.testRoot = avlTree.testRotateLeft(avlTree.testRoot!)

//		print(avlTree.debugDescription)
		let target = "V:7<LC:[ V:5<LC:[  ]-LR:[  ]> ]-LR:[ V:8<LC:[  ]-LR:[  ]> ]>"
		let result = avlTree.debugDescription
		XCTAssert(result == target, "\(result) != \(target)")

	}




}
