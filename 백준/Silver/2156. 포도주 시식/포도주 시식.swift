import Foundation

if let n = Int(readLine()!){
    var arr: [Int] = [0]
    for _ in 1...n{
        arr.append(Int(readLine()!)!)
    }
    
    var dp: [Int] = Array(repeating: 0, count: n + 1)
    dp[1] = arr[1]
    if n > 1{
        dp[2] = arr[1] + arr[2]
        for i in 3..<arr.count{
            dp[i] = max(dp[i - 3] + arr[i - 1] + arr[i], dp[i - 2] + arr[i], dp[i - 1])
        }
    }
    
    print(dp.last!)
}