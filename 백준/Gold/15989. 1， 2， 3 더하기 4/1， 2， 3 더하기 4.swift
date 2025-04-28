import Foundation

// 백준 15989 1, 2, 3 더하기 4
let n = Int(readLine()!)!
let arr = (1...n).map { _ in Int(readLine()!)! }
var dp = Array(repeating: Array(repeating: 0, count: 4), count: max(arr.max()! + 1, 4))

dp[1][1] = 1
dp[2][1] = 1
dp[2][2] = 1
dp[3][1] = 1
dp[3][2] = 1
dp[3][3] = 1

for i in 4..<dp.count {
    dp[i][1] = dp[i - 1][1]
    dp[i][2] = dp[i - 2][1] + dp[i - 2][2]
    dp[i][3] = dp[i - 3][1] + dp[i - 3][2] + dp[i - 3][3]
}

arr.forEach{
    print(dp[$0].reduce(0, +))
}