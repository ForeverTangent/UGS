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


}
