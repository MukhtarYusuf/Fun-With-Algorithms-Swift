//
//  QueueViaStacks.swift
//  Stacks and Queues
//
//  Created by Mukhtar Yusuf on 11/4/20.
//  Copyright © 2020 Mukhtar Yusuf. All rights reserved.
//

import Foundation

// Problem 4: Queue via Stacks

// Solution: 2 Stacks Approach

class QueueViaStacks<T> {
    private var insertStack: Stack<T>
    private var removeStack: Stack<T>
    
    init() {
        insertStack = Stack<T>()
        removeStack = Stack<T>()
    }
    
    func enqueue(_ val: T) {
        insertStack.push(val)
    }
    
    func dequeue() -> T? {
        guard !isEmpty() else { return nil }
        
        if removeStack.isEmpty() {
            while !insertStack.isEmpty() {
                removeStack.push(insertStack.pop()!)
            }
        }
        
        return removeStack.pop()
    }
    
    func isEmpty() -> Bool {
        return insertStack.isEmpty() && removeStack.isEmpty()
    }

}
