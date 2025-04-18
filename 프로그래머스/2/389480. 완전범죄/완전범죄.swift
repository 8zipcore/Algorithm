func solution(_ info: [[Int]], _ n: Int, _ m: Int) -> Int {
    let count = info.count
    let INF = 10000 // 충분히 큰 수
    var dp = Array(repeating: Array(repeating: INF, count: m), count: count + 1)
    
    dp[0][0] = 0 // 아무것도 훔치지 않은 상태
    
    for i in 1...count {
        let a = info[i - 1][0] // A도둑이 남기는 흔적
        let b = info[i - 1][1] // B도둑이 남기는 흔적
        
        for j in 0..<m {
            // 이전 상태가 유효할 때만 갱신
            if dp[i - 1][j] != INF {
                // A도둑이 훔치는 경우
                if dp[i][j] > dp[i - 1][j] + a {
                    dp[i][j] = dp[i - 1][j] + a
                }
                
                // B도둑이 훔치는 경우 (단, 흔적이 m 미만일 때)
                if j + b < m {
                    if dp[i][j + b] > dp[i - 1][j] {
                        dp[i][j + b] = dp[i - 1][j]
                    }
                }
            }
        }
    }
    
    // 마지막 행에서 A의 흔적 최소값 찾기
    var result = INF
    for j in 0..<m {
        if dp[count][j] < n {
            result = min(result, dp[count][j])
        }
    }
    
    return result == INF ? -1 : result
}
