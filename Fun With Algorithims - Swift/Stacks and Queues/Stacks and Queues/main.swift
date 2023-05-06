//
//  main.swift
//  Stacks and Queues
//
//  Created by Mukhtar Yusuf on 11/2/20.
//  Copyright © 2020 Mukhtar Yusuf. All rights reserved.
//

import Foundation

let threeStack = ThreeStack1(size: 10)
threeStack.push(0, 5)
threeStack.push(1, 3)
threeStack.push(2, 1)
threeStack.push(1, 2)
threeStack.push(0, 4)


//while !threeStack.isEmpty(0) {
//    print(threeStack.pop(0)!)
//}

threeStack.push(1, 10)
threeStack.push(1, 12)

threeStack.push(2, 5)
threeStack.push(2, 6)
threeStack.push(2, 7)
threeStack.push(2, 8)
threeStack.push(2, 9)

while !threeStack.isEmpty(1) {
    print(threeStack.pop(1)!)
}

while !threeStack.isEmpty(2) {
    print(threeStack.pop(2)!)
}

let setOfStacks = SetOfStacks<Int>(size: 2)

setOfStacks.push(9)
setOfStacks.push(8)
setOfStacks.push(7)
setOfStacks.push(6)

print(setOfStacks.pop()!)
print(setOfStacks.pop()!)

setOfStacks.push(7)
setOfStacks.push(6)
setOfStacks.push(5)

print("")
while !setOfStacks.isEmpty() {
    print(setOfStacks.pop()!)
}

StacksAndQueuesDemo.main()
