import Foundation

let inputArr = readLine()!.components(separatedBy: " ").map{ return Int($0)! }
let n = inputArr[0]
let k = inputArr[1]

var arr: [[Int]] = [[0,0]]

for _ in 1...n{
    let info = readLine()!.components(separatedBy: " ").map{ return Int($0)! }
    arr.append(info)
}

var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: n + 1), count: k + 1)

for i in 1..<dp.count{
    let maxWeight = i
    for j in 1..<dp[maxWeight].count{
        let weight = arr[j][0]
        let value = arr[j][1]
        
        if weight <= maxWeight {
            dp[i][j] = max(dp[maxWeight - weight][j - 1] + value, dp[i][j - 1])
        } else {
            dp[i][j] = dp[i][j - 1]
        }
    }
}

print(dp[k].last!)