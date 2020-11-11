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

