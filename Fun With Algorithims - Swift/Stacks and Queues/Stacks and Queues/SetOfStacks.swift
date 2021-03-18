//
//  SetOfStacks.swift
//  Stacks and Queues
//
//  Created by Mukhtar Yusuf on 11/4/20.
//  Copyright © 2020 Mukhtar Yusuf. All rights reserved.
//

import Foundation

// Problem 3: Stack of Plates. Follow up: popAtIndex()

// Solution: Array of Stacks With Implicit Capacity

class SetOfStacks<T> {
    private var arrOfStacks: [Stack<T>]
    private var curIndex: Int
    private var curSize: Int
    private let MAX_SIZE: Int
    
    init(size: Int) {
        arrOfStacks = [Stack<T>]()
        arrOfStacks.append(Stack<T>())
        curIndex = 0
        curSize = 0
        MAX_SIZE = size
    }
    
    func push(_ val: T) {
        if curSize == MAX_SIZE {
            let newStack = Stack<T>()
            newStack.push(val)
            
            arrOfStacks.append(newStack)
            curIndex += 1
            curSize = 0
        } else {
            arrOfStacks[curIndex].push(val)
        }
        
        curSize += 1
    }
    

}
