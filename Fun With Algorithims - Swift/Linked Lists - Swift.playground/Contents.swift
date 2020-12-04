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

// Solution 2b: Recursion. Time: O(n), Space: O(n)
func recKToLast(_ node: ListNode?, _ k: Int, _ backIndex: inout Int) -> ListNode? {
    if node == nil { return nil }
    
    var resultNode = recKToLast(node!.next, k, &backIndex)
    if k == backIndex {
        resultNode = node
    }
    backIndex += 1
    
    return resultNode
}

func kToLast1(_ head: ListNode, _ k: Int) -> ListNode? {
    if k < 1 { return nil }
    
    var backIndex = 1
    return recKToLast(head, k, &backIndex)
}

// Solution 2c: 2 Pointer Approach. Time: O(n), Space: O(1)
func kToLast2(_ head: ListNode, _ k: Int) -> ListNode? {
    if k < 1 { return nil }
    
    var current: ListNode! = head
    var runner: ListNode! = head
    
    for _ in 0 ..< k {
        if runner == nil { // k > length
            return nil
        }
        runner = runner.next
    }
    
    while runner != nil {
        runner = runner.next
        current = current.next
    }
    
    return current
}

// Problem 3: Delete Middle

// Solution: Copy Deleted Node
func deleteMiddle(_ node: ListNode) {
    let nextNode: ListNode! = node.next
    if nextNode == nil { return }
    
    node.val = nextNode.val
    node.next = nextNode.next
}

// Problem 4: Partition

// Solution: Two Pointers. Time: O(n), Space: O(1)
func partition(_ head: ListNode, _ x: Int) {
    var current: ListNode! = head
    var tail: ListNode! = head
    
    while current != nil {
        if current.val < x { // Swap. Can also have a method
            let temp = tail.val
            tail.val = current.val
            current.val = temp
            
            tail = tail.next
        }
        
        current = current.next
    }
}

// Problem 5: Sum Lists

// Solution 5a: Iterative Approach. Time: O(n), Space: O(1) - Reverse Order
func sumLists(_ head1: ListNode, _ head2: ListNode) -> ListNode {
    var result: ListNode! = nil
    var cur1: ListNode! = head1
    var cur2: ListNode! = head2
    var cur3: ListNode! = nil
    var carry = 0
    
    while cur1 != nil || cur2 != nil || carry != 0 {
        var val1 = 0; var val2 = 0; var val3 = 0
        
        if cur1 != nil {
            val1 = cur1.val
            cur1 = cur1.next
        }
        if cur2 != nil {
            val2 = cur2.val
            cur2 = cur2.next
        }
        
        val3 = val1 + val2 + carry
        if val3 >= 10 {
            carry = 1
            val3 -= 10
        } else {
            carry = 0
        }
        
        let resultNode = ListNode(val: val3)
        if result == nil {
            result = resultNode
            cur3 = resultNode
        } else {
            cur3.next = resultNode
            cur3 = cur3.next
        }
    }
    
    return result
}

// Solution 5b: Recursion. Time: O(n), Space: O(n) - Reverse Order
func recSumLists(_ node1: ListNode?, _ node2: ListNode?, _ carry: Int) -> ListNode? {
    if node1 == nil && node2 == nil && carry == 0 {
        return nil
    }
    
    var val1 = 0; var val2 = 0; var val3 = 0; var localCarry = 0
    var cur1: ListNode! = node1
    var cur2: ListNode! = node2
    
    if node1 != nil {
        val1 = node1!.val
        cur1 = cur1.next
    }
    if node2 != nil {
        val2 = node2!.val
        cur2 = cur2.next
    }
    
    val3 = val1 + val2 + carry
    if val3 >= 10 {
        val3 -= 10
        localCarry = 1
    }
    
    let cur3 = ListNode(val: val3)
    cur3.next = recSumLists(cur1, cur2, localCarry)
    
    return cur3
}

// Solution 5c: Recursion. Time: O(n), Space: O(n) - Forward Order
func sumLists1(_ head1: ListNode, _ head2: ListNode) -> ListNode {
    let paddedNodes: (fNode: ListNode, sNode: ListNode) = padNodes(head1, head2)
    
    var carry = 0
    var result: ListNode! = recSumLists1(paddedNodes.fNode, paddedNodes.sNode, &carry)
    
    if result.val >= 10 {
        let newResult = ListNode(val: 1)
        result.val -= 10
        newResult.next = result
        result = newResult
    }
    
    return result;
}

func recSumLists1(_ node1: ListNode?, _ node2: ListNode?, _ carry: inout Int) -> ListNode? {
    if node1 == nil && node2 == nil {
        return nil
    }
    
    let result = ListNode(val: 0)
    result.next = recSumLists1(node1!.next, node2!.next, &carry)
    
    result.val = node1!.val + node2!.val + carry
    if result.val >= 10 {
        result.val -= 10
        carry = 1
    } else {
        carry = 0
    }
    
    return result
}

func padNodes(_ n1: ListNode, _ n2: ListNode) -> (ListNode, ListNode) {
    let length1 = calcLength(n1)
    let length2 = calcLength(n2)
    var shorter = length1 < length2 ? n1 : n2
    let longer = length1 > length2 ? n1 : n2
    
    let diff = abs(length1 - length2)
    for _ in 0 ..< diff {
        let padNode = ListNode(val: 0)
        padNode.next = shorter
        shorter = padNode
    }
    
    return (shorter, longer)
}

