import Foundation

if let n = Int(readLine()!){
    var dp: [Int] = Array(repeating: 0, count: 1001)
    dp[1] = 1
    dp[2] = dp[1] + 2
    for i in 3...1000{
        dp[i] = (dp[i - 2] * 2 + dp[i - 1]) % 10007
    }
    
    print(dp[n])
}