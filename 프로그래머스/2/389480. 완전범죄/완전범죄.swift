import Foundation

func solution(_ info:[[Int]], _ n:Int, _ m:Int) -> Int {
    let count = info.count
    var dp = Array(repeating: Array(repeating: 10000, count: m), count: count + 1)
    
    dp[0][0] = 0
    
    for i in 1...count{
        let a = info[i - 1][0]
        let b = info[i - 1][1]
        
        for j in 0..<m{
            dp[i][j] = min(dp[i - 1][j] + a, dp[i][j])
            
            if j + b < m {
                dp[i][j + b] = min(dp[i - 1][j], dp[i][j + b])
            }
        }
    }
    
    let result = dp[count].min()!
    
    return result >= n ? -1 : result
}