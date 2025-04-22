import Foundation

// 백준 2631 줄세우기

let n = Int(readLine()!)!
var arr: [Int] = []
var dp: [Int] = Array(repeating: 1, count: n)

for _ in 1...n{
    arr.append(Int(readLine()!)!)
}

// 옮겨야 하는 최소 아이 수 = 전체 아이 수 - LIS 길이
for i in 1..<n {
    for j in 0..<i{
        if arr[i] > arr[j] {
            dp[i] = max(dp[j] + 1, dp[i])
        }
    }
}

print(n - dp.max()!)