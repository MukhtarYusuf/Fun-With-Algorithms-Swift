//
//  Stack1.swift
//  Stacks and Queues
//
//  Created by Mukhtar Yusuf on 11/3/20.
//  Copyright © 2020 Mukhtar Yusuf. All rights reserved.
//

import Foundation

// Array Based Implementation

class Stack1<T> {
    private var arr: [T]
    
    init() {
        arr = [T]()
    }
    
    func push(_ val: T) {
        arr.insert(val, at: 0)
    }
    
    func pop() -> T? {
        guard !isEmpty() else { return nil }
        
        return arr.remove(at: 0)
    }
    
    func peek() -> T? {
        guard !isEmpty() else { return nil }
        
        return arr[0]
    }
    
    func isEmpty() -> Bool {
        return arr.isEmpty
    }

}
