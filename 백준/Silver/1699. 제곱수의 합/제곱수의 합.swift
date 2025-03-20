import Foundation

// 백준 1699 제곱수의 합

var n = Int(readLine()!)!

var number = 1

var dp = Array(repeating: 0, count: n + 1)

dp[1] = 1

if n > 1 {
    for i in 2...n{
        if (number + 1) * (number + 1) > i {
            let squrt = number * number
            dp[i] = dp[squrt] + dp[i - squrt]
            
            for num in stride(from: number - 1, to: 0, by: -1){
                let squrt = num * num
                dp[i] = min(dp[squrt] + dp[i - squrt], dp[i])
            }
        } else {
            number += 1
            dp[i] = 1
        }
    }
}

print(dp[n])