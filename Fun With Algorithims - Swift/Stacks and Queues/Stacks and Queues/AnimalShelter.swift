//
//  AnimalShelter.swift
//  Stacks and Queues
//
//  Created by Mukhtar Yusuf on 11/5/20.
//  Copyright © 2020 Mukhtar Yusuf. All rights reserved.
//

import Foundation

class AnimalShelter {
    private let dogQueue = Queue<Dog>()
    private let catQueue = Queue<Cat>()
    private var timeStamp = 0
    
    func enqueue(_ animal: Animal) {
        animal.timeStamp = timeStamp
        
        if let dog = animal as? Dog {
            dogQueue.enqueue(val: dog)
        } else if let cat = animal as? Cat {
            catQueue.enqueue(val: cat)
        }
        
        timeStamp += 1
    }
    
    func dequeueAny() -> Animal? {
        guard !isEmpty() else { return nil }
        
        let dogStamp = dogQueue.peek()?.timeStamp ?? Int.max
        let catStamp = catQueue.peek()?.timeStamp ?? Int.max
        
        return dogStamp < catStamp ? dogQueue.dequeue() : catQueue.dequeue()
    }
}
