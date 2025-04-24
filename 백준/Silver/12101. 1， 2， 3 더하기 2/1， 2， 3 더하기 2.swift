import Foundation

// 백준 12101 1, 2, 3 더하기 2

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], k = input[1]
var dp: [[String]] = Array(repeating: [], count: max(n + 1, 4))

dp[1].append("1")
dp[2].append(contentsOf: ["1+1", "2"])
dp[3].append(contentsOf: ["1+1+1", "1+2", "2+1", "3"])

if n > 3 {
    for i in 4...n {
        for j in 1...3 {
            dp[i].append(contentsOf: dp[i - j].map { "\($0)+\(j)" })
        }
    }
}

if dp[n].count < k {
    print("-1")
} else {
    dp[n].sort()
    print(dp[n][k - 1])
}