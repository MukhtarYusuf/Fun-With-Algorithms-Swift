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
    
    func push(_ sNumber: Int, _ val: Int) { // Check sNumber range
        var index = tops[sNumber] + (sNumber * STACK_SIZE)
        index += 1
        
        if !isFull(sNumber) {
            arr[index] = val
            tops[sNumber] += 1
        } else { // Throw Error?
            print("Full Stack")
        }
    }
    
    func pop(_ sNumber: Int) -> Int? {
        guard !isEmpty(sNumber) else { return nil }
        
        let index = tops[sNumber] + (sNumber * STACK_SIZE)
        tops[sNumber] -= 1
        
        return arr[index]
    }
    
    func peek(_ sNumber: Int) -> Int? {
        guard !isEmpty(sNumber) else { return nil }
        
        let index = tops[sNumber] + (sNumber * STACK_SIZE)
        return arr[index]
    }
    

}
