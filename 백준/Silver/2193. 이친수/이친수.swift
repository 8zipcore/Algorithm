import Foundation

let n = Int(readLine()!)!

var dp: [Int] = Array(repeating: 0, count: n + 5)
dp[1] = 1
dp[2] = 1
dp[3] = 2
dp[4] = 3
dp[5] = 5

if n > 5 {
    for i in 6...n{
        // i - 2에 00, 01, 10 을 붙여준 값에
        // i - 2에 00, 01, 10을 붙여주기 전의 값 i - 4의 갯수 차감
        // 01은 항상 뒤에 붙을 수 있으니까
        dp[i] = (dp[i - 2] * 3) - dp[i - 4]
    }
}

print(dp[n])