//
//  Queue.swift
//  Stacks and Queues
//
//  Created by Mukhtar Yusuf on 11/3/20.
//  Copyright © 2020 Mukhtar Yusuf. All rights reserved.
//

import Foundation

// QueueNode Based Implementation

class Queue<T> {
    private class QueueNode<T> {
        var val: T
        var next: QueueNode?
        
        init(val: T) {
            self.val = val
        }
    }
    
    private var first: QueueNode<T>?
    private var last: QueueNode<T>?
    
    func enqueue(val: T) {
        let newNode = QueueNode(val: val)
        
        last?.next = newNode
        last = newNode
        if first == nil {
            first = newNode
        }
    }
    

}
