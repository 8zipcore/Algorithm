import Foundation

// 백준 2294 동전 2

let input = readLine()!.split(separator: " ").map{ return Int($0)! }
let n = input[0], k = input[1]

var arr: [Int] = [0]

for _ in 1...n{
    arr.append(Int(readLine()!)!)
}

arr.sort()

var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: n + 1), count: k + 1)

for i in 1...k{
    for j in 1...n{
        if i == arr[j] {
            dp[i][j] = 1
        } else if i - arr[j] > 0, dp[i - arr[j]][n] > 0 {
            let value = 1 + dp[i - arr[j]][n]
            dp[i][j] = dp[i][j - 1] > 0 ? min(value, dp[i][j - 1]) : value
        } else {
            dp[i][j] = dp[i][j - 1]
        }
    }
}

if dp[k][n] > 0 {
    print(dp[k][n])
} else {
    print("-1")
}