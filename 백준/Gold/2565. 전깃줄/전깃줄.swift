import Foundation

// 백준 2565 전깃줄

let n = Int(readLine()!)!
var a: [Int : Int] = [:]
var arr: [Int] = []

for _ in 1...n{
    let input = readLine()!.split(separator: " ").map{ return Int($0)! }
    a[input[0]] = input[1]
}

a.sorted(by: { $0.key < $1.key }).forEach{
    arr.append($0.value)
}

var dp: [Int] = Array(repeating: 0, count: 500)

dp[0] = 1

for i in 1..<n{
    for j in 0...(i - 1){
        if arr[j] < arr[i]{
            dp[i] = max(dp[i], dp[j])
        }
    }
    dp[i] += 1
}

print(n - dp.max()!)