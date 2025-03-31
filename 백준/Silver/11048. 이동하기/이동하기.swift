import Foundation

// 백준 11048 이동하기

var input = readLine()!.split(separator: " ").map { return Int($0)! }
let n = input[0], m = input[1]

var arr: [[Int]] = [Array(repeating: 0, count: m + 1)]
var dp = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)

for _ in 1...n{
    var input: [Int] = readLine()!.split(separator: " ").map{ return Int($0)! }
    input.insert(0, at: 0)
    
    arr.append(input)
}

for i in 1...n{
    for j in 1...m{
        dp[i][j] = max(dp[i - 1][j - 1], dp[i - 1][j], dp[i][j - 1]) + arr[i][j]
    }
}

print(dp[n][m])