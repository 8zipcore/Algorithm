import Foundation

var arr1: [String] = [""]
arr1.append(contentsOf: Array(readLine()!).map{String($0)})
var arr2: [String] = [""]
arr2.append(contentsOf: Array(readLine()!).map{String($0)})

var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: arr1.count), count: arr2.count)

for i in 1..<arr2.count{
    for j in 1..<arr1.count{
        if arr2[i] == arr1[j]{
            dp[i][j] = dp[i - 1][j - 1] + 1
        } else {
            dp[i][j] = max(dp[i][j - 1], dp[i - 1][j])
        }
    }
}

print(dp[arr2.count - 1].last!)