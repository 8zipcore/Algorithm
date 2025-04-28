import Foundation

// 백준 15988 1, 2, 3 더하기 3
let n = Int(readLine()!)!
let arr = (1...n).map { _ in Int(readLine()!)! }
var dp = Array(repeating: 0, count: max(arr.max()! + 1, 3))

dp[1] = 1
dp[2] = 2
dp[3] = 4

for i in 4..<dp.count {
    dp[i] = (dp[i - 1] + dp[i - 2] + dp[i - 3]) % 1000000009
}

arr.forEach{
    print(dp[$0])
}