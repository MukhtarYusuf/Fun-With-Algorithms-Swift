//
//  StacksAndQueuesDemo.swift
//  Stacks and Queues
//
//  Created by Mukhtar Yusuf on 11/5/20.
//  Copyright © 2020 Mukhtar Yusuf. All rights reserved.
//

import Foundation

class StacksAndQueuesDemo {
    static func main() {
    
    // Problem 5: Sort Stack
    
    // Solution: One Stack Buffer Approach
    
    func sortStack(_ stack: Stack<Int>) { // Ascending Order
        let bufferStack = Stack<Int>()
        
        while !stack.isEmpty() {
            let temp = stack.pop()!
            
            while !bufferStack.isEmpty() && bufferStack.peek()! > temp {
                stack.push(bufferStack.pop()!)
            }
            
            bufferStack.push(temp)
        }
        
        while !bufferStack.isEmpty() {
            stack.push(bufferStack.pop()!)
        }
    }
}
