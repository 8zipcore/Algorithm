import Foundation

// 백준 17404 RGB거리 2

let n = Int(readLine()!)!
var arr: [[Int]] = []
var result = Int.max

for _ in 1...n{
    arr.append(readLine()!.components(separatedBy: " ").map{ return Int($0)! })
}

for i in 0...2{
    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: 3), count: n)
    
    for j in 0...2{
        if i == j {
            dp[0][j] = arr[0][j]
        } else {
            dp[0][j] = 1001
        }
    }
    
    for j in 1..<n{
        dp[j][0] = arr[j][0] + min(dp[j - 1][1], dp[j - 1][2])
        dp[j][1] = arr[j][1] + min(dp[j - 1][0], dp[j - 1][2])
        dp[j][2] = arr[j][2] + min(dp[j - 1][0], dp[j - 1][1])
    }
    
    for j in 0...2{
        if i != j {
            result = min(result, dp[n - 1][j])
        }
    }
}

print(result)