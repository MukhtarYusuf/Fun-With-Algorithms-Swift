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

// 2c. Time: O(n), Space: O(1)
func isPermutation2(s1: String?, s2: String?) -> Bool {
    if let string1 = s1, let string2 = s2 {
        let length1 = string1.count
        let length2 = string2.count
        if length1 != length2 { return false }
        
        var tracker = [Int](repeating: 0, count: 256)
        var uniqueCount = 0
        for i in 0 ..< length1 {
            let character = string1[string1.index(string1.startIndex, offsetBy: i)]
            let index = Int(character.asciiValue!)
            if tracker[index] == 0 { uniqueCount += 1 }
            tracker[index] += 1
        }
        
        for i in 0 ..< length2 {
            let character = string2[string2.index(string2.startIndex, offsetBy: i)]
            let index = Int(character.asciiValue!)
            if tracker[index] == 0 { return false }
            tracker[index] -= 1
            if tracker[index] == 0 { uniqueCount -= 1 }
        }
        
        return uniqueCount == 0
    }
    
    return false
}

// 3. Time: O(n), Space: O(1)
func urlify(_ arr: inout [Character], _ length: Int) {
    var newLength = length
    for i in 0 ..< length {
        if arr[i] == " " {
            newLength += 2
        }
    }
    
    var index1 = length - 1; var index2 = newLength - 1
    while index1 >= 0 {
        if arr[index1] == " " {
            arr[index2] = "0"
            arr[index2 - 1] = "2"
            arr[index2 - 2] = "%"
            index2 -= 2
        } else {
            arr[index2] = arr[index1]
        }
        
        index1 -= 1; index2 -= 1
    }
}

// 4a. Time: O(n), Space: O(n)
func pPermut(_ word: String) -> Bool {
    if word.isEmpty { return false }
    
    var tracker = Set<Character>()
    for c in word {
        if tracker.contains(c) {
            tracker.remove(c)
        } else {
            tracker.insert(c)
        }
    }
    
    return tracker.count <= 1
}

// 4b. Time: O(n), Space: O(1)
func pPermut1(_ word: String) -> Bool {
    if word.isEmpty { return false }
    
    var tracker = [Bool](repeating: false, count: 256)
    var uCount = 0
    for i in 0 ..< word.count {
        let index = word.index(word.startIndex, offsetBy: i)
        let char = Character(word[index].lowercased())
        let tIndex = Int(char.asciiValue!)
        
        tracker[tIndex] = !tracker[tIndex]
        if tracker[tIndex] {
            uCount += 1
        } else {
            uCount -= 1
        }
    }
    
    return uCount <= 1
}

// 5. Time: O(n), Space: O(1)
func oneAway(_ s1: String, _ s2: String) -> Bool {
    let length1 = s1.count
    let length2 = s2.count
    let diff = abs(length1 - length2)
    if diff > 1 { return false }
    
    var ptr1 = 0; var ptr2 = 0; var diffCount = 0
    while ptr1 < length1 {
        let sIndex1 = s1.index(s1.startIndex, offsetBy: ptr1)
        let sIndex2 = s2.index(s2.startIndex, offsetBy: ptr2)
        if s1[sIndex1] != s2[sIndex2] {
            diffCount += 1
            if diffCount > 1 { return false }
            
            if length1 < length2 {
                ptr1 -= 1
            } else if length2 < length1 {
                ptr2 -= 1
            }
        }
        
        ptr1 += 1; ptr2 += 2
    }
    
    return true
}

// 6. Time: O(n), Space: O(1)
func compressString(_ s: String) -> String {
    if s.count <= 1 { return s }
    
    var result = ""
    var prevChar = s[s.startIndex]
    var count = 1
    var wasCompressed = false

    for i in 1 ..< s.count {
        let sIndex = s.index(s.startIndex, offsetBy: i)
        let curChar = s[sIndex]
        if prevChar != curChar {
            result.append(prevChar)
            result.append(String(count))
            prevChar = curChar
            count = 1
        } else {
            count += 1
            wasCompressed = true
        }
        
        if i == s.count - 1 {
            result.append(prevChar)
            result.append(String(count))
        }
    }
    
    if !wasCompressed {
        result = s
    }
    
    return result
}

// 7. Time: O(n), Space: O(1)
func rotateMatrix(_ mat: inout [[Int]]) {
    if mat.count == 0 || mat[0].count == 0 || mat.count != mat[0].count {
        return
    }
    
    let n = mat.count // nxn matrix
    for i in 0 ..< n/2 {
        let first = 0+i
        let last = n-1-i
        let size = last-first
        
        for j in 0 ..< size {
            let temp = mat[first][first+j] // Store top in temp
            mat[first][first+j] = mat[last-j][first] // Copy left to top
            mat[last-j][first] = mat[last][last-j] // Copy bottom to left
            mat[last][last-j] = mat[first+j][last] // Copy right to bottom
            mat[first+j][last] = temp // Copy top to right
        }
    }
}

// 8. Time: O(mn(m+n)), Space: O(m+n)
func setZeros(_ mat: inout [[Int]]) {
    if mat.count == 0 || mat[0].count == 0 { return }
    
    var rowFlags = [Bool](repeating: false, count: mat.count)
    var colFlags = [Bool](repeating: false, count: mat[0].count)
    
    for row in 0 ..< mat.count {
        for col in 0 ..< mat[0].count {
            if mat[row][col] == 0 {
                rowFlags[row] = true
                colFlags[col] = true
            }
        }
    }
    
    for row in 0 ..< rowFlags.count {
        if rowFlags[row] {
            for col in 0 ..< mat[0].count {
                mat[row][col] = 0
            }
        }
    }
    
    for col in 0 ..< colFlags.count {
        if colFlags[col] {
            for row in 0 ..< mat.count {
                mat[row][col] = 0
            }
        }
    }
}

