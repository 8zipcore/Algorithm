import Foundation

// 백준 15486 퇴사 2

let n = Int(readLine()!)!
var dp: [Int] = Array(repeating: 0, count: n + 1)
var result = 0

for i in 0..<n{
    let arr = readLine()!.split(separator: " ").map{ return Int($0)! }
               
    let time = arr[0]
    let value = arr[1]
    
    if i > 0 {
        dp[i] = max(dp[i - 1], dp[i])
    }
    
    if time + i <= n {
        dp[time + i] = max(dp[i + time], value + dp[i])
        result = max(result, dp[time + i])
    }
}

print(result)