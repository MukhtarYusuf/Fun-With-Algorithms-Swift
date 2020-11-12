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

