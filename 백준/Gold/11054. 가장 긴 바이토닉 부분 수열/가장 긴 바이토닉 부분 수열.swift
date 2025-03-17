import Foundation

// 백준 11054 가장 긴 바이토닉 부분 수열

var n = Int(readLine()!)!
var input = readLine()!.split(separator: " ").map{Int($0)!}
var dp1 = Array(repeating: 1, count: 1001)
var dp2 = Array(repeating: 1, count: 1001)
var result = Array(repeating: 1, count: 1001)

for i in 1...n{
    for j in 1...i{
        if input[i - 1] > input[j - 1] {
            dp1[i] = max(dp1[i], dp1[j] + 1)
        }
    }
}

for i in (1...n).reversed(){
    for j in (i...n).reversed(){
        if input[i - 1] > input[j - 1]{
            dp2[i] = max(dp2[i], dp2[j] + 1)
        }
    }
}

for i in 1...n{
    result[i] = dp1[i] + dp2[i]
}

print(result.max()! - 1)