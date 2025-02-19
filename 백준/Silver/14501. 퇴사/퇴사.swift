import Foundation

if let n = Int(readLine()!){
    var arr: [[Int]] = []
    for _ in 1...n{
        arr.append(readLine()!.components(separatedBy: " ").map { return Int($0)! })
    }
    
    var dp = Array(repeating: 0, count: n + 1)
    
    for i in arr.indices.reversed(){
        let day = arr[i][0]
        let cost = arr[i][1]
        
        if i + day < n + 1{
            dp[i] = max(dp[i + 1], cost + dp[i + day])
        } else {
            dp[i] = dp[i + 1]
        }
    }
    
    print(dp.max()!)
}