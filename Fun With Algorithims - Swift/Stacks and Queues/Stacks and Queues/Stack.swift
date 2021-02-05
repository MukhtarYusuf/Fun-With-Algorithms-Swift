//
//  Stack.swift
//  Stacks and Queues
//
//  Created by Mukhtar Yusuf on 11/2/20.
//  Copyright © 2020 Mukhtar Yusuf. All rights reserved.
//

import Foundation

// This is a Stack Node Based Implementation

class Stack<T> {
    private class StackNode<T> {
        var val: T
        var next: StackNode?
        
        init(val: T) {
            self.val = val
        }
    }
    
    private var top: StackNode<T>?
    
    func push(_ val: T) {
        let newNode = StackNode(val: val)
        newNode.next = top
        top = newNode
    }
    
    
}
