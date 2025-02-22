import Foundation

var n = Int(readLine()!)!

if n < 3{
    print(n)
} else {
    var dp: [Int] = Array(repeating: 0, count: n + 1)
    dp[1] = 1
    dp[2] = 2
    
    for i in 3...n{
        dp[i] = (dp[i - 1] + dp[i - 2]) % 15746
    }
    
    print(dp[n])
}