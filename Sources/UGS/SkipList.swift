//
//  File.swift
//  
//
//  Created by Stanley Rosenbaum on 12/11/21.
//

import Foundation

class SLNode<T: Comparable & Codable> {
    var value: T?
    var forward: [SLNode?]
    
    init(value: T?, level: Int) {
        self.value = value
        self.forward = Array(repeating: nil, count: level + 1)
    }
}

class SkipList<T: Comparable & Codable> {
    private let maxLevel: Int
    private var level: Int
    private let head: SLNode<T>
    
    init(maxLevel: Int) {
        self.maxLevel = maxLevel
        self.level = 0
        self.head = SLNode(value: nil, level: maxLevel)
    }
    
    private func randomLevel() -> Int {
        var level = 0
        while level < maxLevel && Bool.random() {
            level += 1
        }
        return level
    }
    
    public func insert(value: T) {
        var update = Array(repeating: head, count: maxLevel + 1)
        var current = head
        
        for i in stride(from: level, through: 0, by: -1) {
            while let next = current.forward[i], next.value! < value {
                current = next
            }
            update[i] = current
        }
        
        let level = randomLevel()
        if level > level {
            for i in (level + 1)...level {
                update[i] = head
            }
            level = level
        }
        
        let newNode = SLNode(value: value, level: level)
        for i in 0...level {
            newNode.forward[i] = update[i].forward[i]
            update[i].forward[i] = newNode
        }
    }
    
    public func search(value: T) -> Bool {
        var current = head
        for i in stride(from: level, through: 0, by: -1) {
            while let next = current.forward[i], next.value! < value {
                current = next
            }
        }
        current = current.forward[0]!
        return current.value == value
    }
    
    public func delete(value: T) {
        var update = Array(repeating: head, count: maxLevel + 1)
        var current = head
        
        for i in stride(from: level, through: 0, by: -1) {
            while let next = current.forward[i], next.value! < value {
                current = next
            }
            update[i] = current
        }
        
        current = current.forward[0]!
        if current.value == value {
            for i in 0...level {
                if update[i].forward[i] !== current {
                    break
                }
                update[i].forward[i] = current.forward[i]
            }
            
            while level > 0 && head.forward[level] == nil {
                level -= 1
            }
        }
    }
}
