//
//  File.swift
//  
//
//  Created by Stanley Rosenbaum on 12/11/24.
//

import Foundation

enum RBColor: Codable {
    case red
    case black
}

class RBNode<T: Comparable & Codable>: Codable, JSONDescription {

    var data: T
    var left: RBNode<T>?
    var right: RBNode<T>?
    var parent: RBNode<T>?
    var color: RBColor
    
    init(data: T, color: RBColor, parent: RBNode? = nil) {
        self.data = data
        self.color = color
        self.parent = parent
    }
}

extension RBNode: CustomStringConvertible {

    var debugDescription: String {
        let theLeftDescription = left?.debugDescription ?? ""
        let theRightDescription = right?.debugDescription ?? ""
        return "V:\(self.data)<LC:[ \(theLeftDescription) ]-LR:[ \(theRightDescription) ]>"
    }

    var description: String {
        let noBrackets = removeBracketLinesFromString(jsonDescription)
        var results = "\n"
        for element in noBrackets {
            results = results + element
                .replacingOccurrences(of: "\"data\" : ", with: "")
                .replacingOccurrences(of: ",", with: "")
        }
        return "\nRIGHT\n\(results)\nLEFT\n"
    }

    fileprivate func removeBracketLinesFromString(_ string: String) -> [String] {

        let workString = "\(string)\n"


        let noBrackets = Array(workString.split(separator: "\n"))

        var results = [String]()

        for element in noBrackets {
            if element.contains("{") {
            } else if element.contains("}") {
            } else {
                results.append("\(element)\n")
            }
        }

        return results

    }

}

/**
 RedBlack Tree
 */
class RBTree<T: Comparable & Codable> {

    // MARK: - Properties

    private var root: RBNode<T>?
    
    func insert(value: T) {
        let newRBNode = RBNode(data: value, color: .red)
        if let root = root {
            insertHelper(root, newRBNode)
            fixInsert(newRBNode)
        } else {
            root = newRBNode
            root?.color = .black
        }
    }
    
    private func insertHelper(_ root: RBNode<T>, _ node: RBNode<T>) {
        if node.data < root.data {
            if let left = root.left {
                insertHelper(left, node)
            } else {
                root.left = node
                node.parent = root
            }
        } else {
            if let right = root.right {
                insertHelper(right, node)
            } else {
                root.right = node
                node.parent = root
            }
        }
    }
    
    private func fixInsert(_ node: RBNode<T>) {
        var node = node
        while let parent = node.parent, parent.color == .red {
            let grandparent = parent.parent
            if parent === grandparent?.left {
                let uncle = grandparent?.right
                if uncle?.color == .red {
                    parent.color = .black
                    uncle?.color = .black
                    grandparent?.color = .red
                    node = grandparent!
                } else {
                    if node === parent.right {
                        node = parent
                        rotateLeft(node)
                    }
                    parent.color = .black
                    grandparent?.color = .red
                    rotateRight(grandparent!)
                }
            } else {
                let uncle = grandparent?.left
                if uncle?.color == .red {
                    parent.color = .black
                    uncle?.color = .black
                    grandparent?.color = .red
                    node = grandparent!
                } else {
                    if node === parent.left {
                        node = parent
                        rotateRight(node)
                    }
                    parent.color = .black
                    grandparent?.color = .red
                    rotateLeft(grandparent!)
                }
            }
        }
        root?.color = .black
    }
    
    private func rotateLeft(_ node: RBNode<T>) {
        let rightChild = node.right
        node.right = rightChild?.left
        if rightChild?.left != nil {
            rightChild?.left?.parent = node
        }
        rightChild?.parent = node.parent
        if node.parent == nil {
            root = rightChild
        } else if node === node.parent?.left {
            node.parent?.left = rightChild
        } else {
            node.parent?.right = rightChild
        }
        rightChild?.left = node
        node.parent = rightChild
    }
    
    private func rotateRight(_ node: RBNode<T>) {
        let leftChild = node.left
        node.left = leftChild?.right
        if leftChild?.right != nil {
            leftChild?.right?.parent = node
        }
        leftChild?.parent = node.parent
        if node.parent == nil {
            root = leftChild
        } else if node === node.parent?.right {
            node.parent?.right = leftChild
        } else {
            node.parent?.left = leftChild
        }
        leftChild?.right = node
        node.parent = leftChild
    }
}
