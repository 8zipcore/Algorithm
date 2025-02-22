import Foundation

var n = Int(readLine()!)!
let arr: [Int] = [0] + readLine()!.split(separator: " ").map{ return Int($0)! }

var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: n + 1), count: n + 1)

for i in 1...n{
    for j in 1...n{
        if j <= i{
            dp[i][j] = max(dp[i][j - 1], dp[i - j][j] + arr[j])
        } else {
            dp[i][j] = dp[i][j - 1]
        }
    }
}

print(dp[n][n])