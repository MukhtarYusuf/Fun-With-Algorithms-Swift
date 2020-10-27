import UIKit

// Utilities
func printMatrix(_ mat: [[Any]]) {
    var output = ""
    for i in 0 ..< mat.count {
        output.append("[")
        for j in 0 ..< mat[0].count {
            output.append("\(mat[i][j])")
            if j != mat[0].count-1 {
                output.append(", ")
            }
        }
        output.append("] \n")
    }
    print(output)
}

var str = "Hello, playground"
var str1 = "abcdeA"
var str2 = "bcaAde"
var str3 = "abc"
var arr = Array(str) + [" ", " ", " ", " "]
var mat = [[0, 2, 3, 4],
           [5, 6, 7, 8],
           [9, 0, 11, 12],
           [13, 14, 15, 16]]

// -- Solutions --

// 1a. Time: O(n2), Space: O(1)
func containsDups(s: String?) -> Bool {
    guard let string = s else { return false }
    if string.isEmpty { return false }
    
    for i in 0 ..< string.count-1 {
        for j in i+1 ..< string.count {
            let firstIndex = string.index(string.startIndex, offsetBy: i)
            let secondIndex = string.index(string.startIndex, offsetBy: j)
            if string[firstIndex] == string[secondIndex] {
                return true
            }
        }
    }
    
    return false
}

// 1b. Time: O(n), Space: O(n)
func containsDups1(s: String?) -> Bool {
    guard let string = s else { return false }
    if string.isEmpty { return false }
    
    var tracker = Set<Character>()
    for i in 0 ..< string.count {
        let index = string.index(string.startIndex, offsetBy: i)
        if tracker.contains(string[index]) {
            return true
        } else {
            tracker.insert(string[index])
        }
    }
    
    return false
}

// 1c. Time: O(n), Space: O(1)
func containsDups2(s: String?) -> Bool {
    guard let letters = s else { return false }
    if letters.isEmpty { return false }
    
    var tracker = [Bool](repeating: false, count: 256) // Similar to extended ASCII
    for i in 0 ..< letters.count {
        let character = letters[letters.index(letters.startIndex, offsetBy: i)]
        let intValue = Int(character.asciiValue!)
        if tracker[intValue] {
            return true
        } else {
            tracker[intValue] = true
        }
    }
    
    return false
}

// 2a. Time: O(nlogn), Space: O(1)
func isPermutation(s1: String?, s2: String?) -> Bool {
    if let string1 = s1, let string2 = s2 {
        if string1.count != string2.count {
            return false
        }
        
        return string1.sorted() == string2.sorted()
    }
    
    return false
}

// 2b. Time: O(nlogn), Space: O(n)
func isPermutation1(s1: String?, s2: String?) -> Bool {
    if let string1 = s1, let string2 = s2 {
        let length1 = string1.count
        let length2 = string2.count
        if length1 != length2 { return false }
        
        var tracker = [Character : Int]()
        for i in 0 ..< length1 {
            let character = string1[string1.index(string1.startIndex, offsetBy: i)]
            if tracker[character] != nil {
                tracker[character]! += 1
            } else {
                tracker[character] = 1
            }
        }
        
        for i in 0 ..< length2 {
            let character = string2[string2.index(string2.startIndex, offsetBy: i)]
            if tracker[character] != nil {
                tracker[character]! -= 1
                if tracker[character]! == 0 {
                    tracker[character] = nil
                }
            } else {
                return false
            }
        }
        
        return tracker.isEmpty
    }
    
    return false
}

