import Foundation

// 백준 11055 가장 큰 증가하는 부분 수열

var n = Int(readLine()!)!
var input = readLine()!.split(separator: " ").map { return Int($0)! }

var dp = Array(repeating: 0, count: n)

dp[0] = input[0]

for i in 1..<n{
    var num = 0
    
    for j in (0...(i - 1)).reversed(){
        if input[i] > input[j]{
            num = max(num, dp[j])
        }
    }
    
    dp[i] = num + input[i]
}

print(dp.max()!)