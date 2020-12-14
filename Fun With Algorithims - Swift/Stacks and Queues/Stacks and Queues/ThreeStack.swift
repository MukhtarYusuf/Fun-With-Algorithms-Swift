//
//  ThreeStack.swift
//  Stacks and Queues
//
//  Created by Mukhtar Yusuf on 11/3/20.
//  Copyright © 2020 Mukhtar Yusuf. All rights reserved.
//

import Foundation

// Problem 1: Three in One

// Solution 1a: Contiguous Stack Elements

class ThreeStack {
    var arr: [Int]
    var tops: [Int]
    var STACK_SIZE: Int
    
    init(size: Int) {
        STACK_SIZE = size
        arr = [Int](repeating: 0, count: STACK_SIZE * 3)
        tops = [-1, -1, -1]
    }

}
