import Foundation

if let count = Int(readLine()!){
    var triangle: [[Int]] = []
    
    for _ in 1...count{
        triangle.append(readLine()!.components(separatedBy: " ").map{ return Int($0)!})
    }
    
    var dp = Array(repeating: Array(repeating: 0, count: count), count: count)
    dp[0][0] = triangle[0][0]
    for i in 1..<dp.count{
        dp[i][0] = dp[i - 1][0] + triangle[i][0]
        for j in 1..<triangle[i].count{
            dp[i][j] = max(dp[i - 1][j - 1], dp[i - 1][j]) + triangle[i][j]
        }
    }
    
    print(dp[count - 1].max()!)
}