import Foundation

// 백준 1965 상자넣기

let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { return Int($0)! }
var dp = Array(repeating: 0, count: n)
dp[0] = 1

for i in 1..<n{
    for j in (0..<i).reversed(){
        if arr[i] > arr[j]{
            dp[i] = max(dp[i], dp[j])
        }
    }
    dp[i] += 1
}

print(dp.max()!)