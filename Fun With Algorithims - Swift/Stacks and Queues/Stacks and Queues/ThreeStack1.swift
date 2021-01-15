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
    
    func push(_ sNumber: Int, _ val: Int) {
        if !isFull() {
            let curNode = arr[globalIndex]
            curNode.previousTop = tops[sNumber]
            curNode.val = val
            tops[sNumber] = globalIndex
            
            if curNode.nextIndex != -1 {
                globalIndex = curNode.nextIndex
            } else {
                globalIndex += 1
            }
        } else {
            print("Stack is Full!")
        }
    }
    
    func pop(_ sNumber: Int) -> Int? {
        if !isEmpty(sNumber) {
            let poppedNode = arr[tops[sNumber]]
            
            if tops[sNumber] < globalIndex {
                poppedNode.nextIndex = globalIndex
                globalIndex = tops[sNumber] == -1 ? 0 : tops[sNumber]
            } else {
                poppedNode.nextIndex = arr[globalIndex].nextIndex
                arr[globalIndex].nextIndex = tops[sNumber]
            }
            tops[sNumber] = poppedNode.previousTop
            
            return poppedNode.val
        } else {
            return nil
        }
    }
    
    func peek(_ sNumber: Int) -> Int? {
        if !isEmpty(sNumber) {
            return arr[tops[sNumber]].val
        } else {
            return nil
        }
    }
    
    func isFull() -> Bool {
        return globalIndex >= arr.count // Check?
    }
    
    func isEmpty(_ sNumber: Int) -> Bool {
        return tops[sNumber] == -1
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
