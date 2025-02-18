import Foundation

if let count = Int(readLine()!){
    var site: [[Int]] = []
    
    for _ in 1...count{
        site.append(readLine()!.components(separatedBy: " ").map{ return Int($0)! })
    }
    
    // 조합 점화식
    // nCr = n-1Cr-1 + n-1Cr
    // 전체경우의 수 = 원소 중 하나를 포함시켰을 상태 + 원소 중 하나를 배제시켰을 상태
    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: 31), count: 31)
    
    for i in 1...30{
        for j in 1...i{
            if i == j {
                dp[i][j] = 1
            } else if i < j {
                dp[i][j] = 0
            } else {
                if j == 1{
                    dp[i][j] = i
                } else{
                    dp[i][j] = dp[i - 1][j - 1] + dp[i - 1][j]
                }
            }
        }
    }
    
    site.forEach{
        let west = $0[0]
        let east = $0[1]
        
        print(dp[east][west])
    }

}