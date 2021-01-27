//
//  MinStack.swift
//  Stacks and Queues
//
//  Created by Mukhtar Yusuf on 11/3/20.
//  Copyright © 2020 Mukhtar Yusuf. All rights reserved.
//

import Foundation

// Problem 2: Stack Min

// Solution: Custom StackNode Approach

class MinStack {
    private var top: StackNode?
    
    func push(val: Int) {
        let newNode = StackNode(val: val)
        if top == nil || val < top!.val {
            newNode.min = val
        } else {
            newNode.min = top!.min
        }
        
        newNode.next = top
        top = newNode
    }
    
    func pop() -> Int? {
        let poppedValue = top?.val
        top = top?.next
        
        return poppedValue
    }
    
    func min() -> Int? { // Could make non-optional
        return top?.min
    }
    
}

fileprivate class StackNode { // Could be private inner class
    var val: Int
    var min: Int
    var next: StackNode?
    
    init(val: Int) {
        self.val = val
        min = Int.max
    }
}

// min = 3,
// push(2), min = 2
// pop() -> 2, min = 3,
// Needed: 5 -> 3 -> 2

// bottom -> top
// 10, min: 10 -> 11, min: 10 -> 9, min: 9 -> 12, min: 9


