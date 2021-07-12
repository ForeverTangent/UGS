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

		let description = avlNode.description
		XCTAssert(description == "V:5<LC:[  ]-LR:[  ]>", "\(description) != V:5<LC:[  ]-LR:[  ]>")

		let encoder = JSONEncoder()
		encoder.outputFormatting = .prettyPrinted
		let data = try? encoder.encode(avlNode)
		let jsonDescription = String(data:data!, encoding: .utf8)!
		print(jsonDescription)


	}

	func testAVLNode1() {

		let avlNode = AVLNode(data: 5)
		let avlNodeLeft = AVLNode(data: 3)
		let avlNodeRight = AVLNode(data: 7)

		avlNode.left = avlNodeLeft
		avlNode.right = avlNodeRight

		let description = avlNode.description
		XCTAssert(description == "V:5<LC:[ V:3<LC:[  ]-LR:[  ]> ]-LR:[ V:7<LC:[  ]-LR:[  ]> ]>",
				  "\(description) != V:5<LC:[ V:3<LC:[  ]-LR:[  ]> ]-LR:[ V:7<LC:[  ]-LR:[  ]> ]>")

		let encoder = JSONEncoder()
		encoder.outputFormatting = .prettyPrinted
		let data = try? encoder.encode(avlNode)
		let jsonDescription = String(data:data!, encoding: .utf8)!
		print(jsonDescription)


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

		let description = avlNode.description
		XCTAssert(description == "V:5<LC:[ V:3<LC:[ V:2<LC:[  ]-LR:[  ]> ]-LR:[ V:4<LC:[  ]-LR:[  ]> ]> ]-LR:[ V:7<LC:[ V:6<LC:[  ]-LR:[  ]> ]-LR:[ V:8<LC:[  ]-LR:[  ]> ]> ]>",
				  "\(description) != V:5<LC:[ V:3<LC:[ V:2<LC:[  ]-LR:[  ]> ]-LR:[ V:4<LC:[  ]-LR:[  ]> ]> ]-LR:[ V:7<LC:[ V:6<LC:[  ]-LR:[  ]> ]-LR:[ V:8<LC:[  ]-LR:[  ]> ]> ]>")

		let encoder = JSONEncoder()
		encoder.outputFormatting = .prettyPrinted
		let data = try? encoder.encode(avlNode)
		let jsonDescription = String(data:data!, encoding: .utf8)!
		print(jsonDescription)

	}


	func testAVLTree0() {
		let avlTree = AVLTree<Int>()

		avlTree.insert(5)

		print(avlTree)

		let encoder = JSONEncoder()
		encoder.outputFormatting = .prettyPrinted
		let data = try? encoder.encode(avlTree)
		let jsonDescription = String(data:data!, encoding: .utf8)!
		print(jsonDescription)

	}



}
