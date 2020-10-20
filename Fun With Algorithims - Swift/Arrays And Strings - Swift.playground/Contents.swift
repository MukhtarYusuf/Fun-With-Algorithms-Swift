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

