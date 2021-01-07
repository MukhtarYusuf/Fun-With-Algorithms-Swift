//
//  ThreeStack1.swift
//  Stacks and Queues
//
//  Created by Mukhtar Yusuf on 11/3/20.
//  Copyright © 2020 Mukhtar Yusuf. All rights reserved.
//

import Foundation

// Problem 1: Three in One

// Solution 1b: Dynamic Arrangement of Stack Elements

class ThreeStack1 {
    private var arr: [StackNode]
    private var tops: [Int]
    private var STACK_SIZE: Int
    private var globalIndex: Int
    
    init(size: Int) {
        STACK_SIZE = size
        
        arr = [StackNode]()
        for _ in 0 ..< STACK_SIZE {
            arr.append(StackNode(val: 0))
        }
        
        tops = [-1, -1, -1]
        globalIndex = 0
    }
    
}

/*
 for push
    set lastTop for node
    update top for stack
    if globalIndex != -1
        update globalIndex + 1
    else
        update globalIndex = nextIndex
 
 for pop
    if popIndex < globalIndex
        set nextIndex = globalIndex
        set globalIndex = popIndex
    else
        arr[popIndex].nextIndex = arr[globalIndex].nextIndex
        arr[globalIndex].nextIndex = popIndex
 */
