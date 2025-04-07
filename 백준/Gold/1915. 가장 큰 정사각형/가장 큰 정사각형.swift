import Foundation

// 백준 1915 가장 큰 정사각형

var input = readLine()!.split(separator: " ").map{ return Int($0)! }
let m = input[0], n = input[1]

var arr: [[String]] = Array(repeating: Array(repeating: "", count: n + 1), count: m + 1)
var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
var result = 0

for i in 1...m{
    let input = readLine()!.map { String($0) }
    
    input.indices.forEach{
        arr[i][$0 + 1] = input[$0]
    }
}

for i in 1...m{
    for j in 1...n{
        if arr[i][j] == "1" {
            dp[i][j] = min(dp[i - 1][j - 1], dp[i - 1][j], dp[i][j - 1]) + 1
            result = max(result, dp[i][j])
        }
    }
}

print(result * result)