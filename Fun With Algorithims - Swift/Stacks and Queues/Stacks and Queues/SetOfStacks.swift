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
    
    func pop() -> T? {
        guard !isEmpty() else { return nil }
        
        var curStack = arrOfStacks[curIndex]
        if curStack.isEmpty() {
            arrOfStacks.remove(at: curIndex)
            curIndex -= 1
            curStack = arrOfStacks[curIndex]
            curSize = MAX_SIZE
        }
        curSize -= 1
        
        return curStack.pop()
    }
    
    func popAt(index: Int) -> T? {
        guard !isEmpty() else { return nil }
        
        var poppedValue: T?
        if index == curIndex {
            poppedValue = pop()
        } else {
            poppedValue = arrOfStacks[index].pop()
            shiftStacks(index)
        }
        
        return poppedValue
    }
    
    func isEmpty() -> Bool {
        return curIndex == 0 && arrOfStacks[0].isEmpty()
    }
    
    private func shiftStacks(_ startIndex: Int) {
        for i in startIndex ..< arrOfStacks.count - 1 {
            shiftTwoStacks(i, i + 1)
        }
        
        curSize -= 1
    }
    
    private func shiftTwoStacks(_ firstIndex: Int, _ secondIndex: Int) {
        let firstStack = arrOfStacks[firstIndex]
        let secondStack = arrOfStacks[secondIndex]
        let bufferStack = Stack<T>()
        
        if secondStack.isEmpty() {
            curSize = MAX_SIZE
            arrOfStacks.remove(at: secondIndex)
        } else {
            while !secondStack.isEmpty() {
                bufferStack.push(secondStack.pop()!)
            }
            
            firstStack.push(bufferStack.pop()!)
            
            while !bufferStack.isEmpty() {
                secondStack.push(bufferStack.pop()!)
            }
        }
    }

}
