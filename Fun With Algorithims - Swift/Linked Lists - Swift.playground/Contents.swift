import UIKit

var str = "Hello, playground"

class ListNode {
    var val = 0
    var next: ListNode?
    
    init(val: Int) {
        self.val = val
    }
}

// Utilities
func calcLength(_ node: ListNode?) -> Int {
    var current: ListNode! = node
    var length = 0
    
    while current != nil {
        current = current.next
        length += 1
    }
    
    return length
}

// Problem 1. Remove Duplicates

// Solution 1a: 2 loops. Time: O(n^2), Space: O(1)
func removeDups(_ head: ListNode) {
    var current: ListNode! = head
    
    while current.next != nil {
        var previous: ListNode! = current
        var runner: ListNode! = current.next
        while runner != nil {
            if current.val == runner.val {
                previous.next = runner.next
            } else {
                previous = runner
            }
            
            runner = runner.next
        }
        
        current = current.next
    }
}

// Solution 1b: Set/Dictionary Approach. Time: O(n), Space: O(n)
func removeDups1(_ head: ListNode) {
    var tracker = Set<Int>()
    var current: ListNode! = head
    var previous: ListNode! = head
    
    while current != nil {
        if tracker.contains(current.val) {
            previous.next = current.next
        } else {
            tracker.insert(current.val)
            previous = previous.next
        }
        
        current = current.next
    }
}

// Problem 2: Return kth to Last

// Solution 2a: Formula Approach. Time: O(n), Space: O(1)
func kToLast(_ head: ListNode, _ k: Int) -> ListNode? {
    if k < 1 { return nil }
    
    var current: ListNode! = head
    let length = calcLength(head)
    
    let nodeIndex = length - k
    if nodeIndex < 0 {
        return nil
    }
    
    for _ in 0 ..< nodeIndex {
        current = current.next
    }
    
    return current
}

