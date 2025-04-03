import Foundation

// 백준 1937 욕심쟁이 판다

var n = Int(readLine()!)!

var arr: [[Int]] = []
var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
var result = 0

for _ in 1...n{
    var input: [Int] = readLine()!.split(separator: " ").map { return Int($0)! }
    arr.append(input)
}

func dfs(_ x: Int, _ y: Int) -> Int {
    if dp[x][y] > 0 {
        return dp[x][y]
    }
    dp[x][y] = 1
    
    var dx = [1, 0, -1, 0]
    var dy = [0, 1, 0, -1]
    
    for i in 0...3{
        var nx = x + dx[i]
        var ny = y + dy[i]
        
        if nx >= 0, ny >= 0, nx < n, ny < n{
            if arr[x][y] < arr[nx][ny]{
                dp[x][y] = max(dp[x][y], dfs(nx, ny) + 1)
            }
        }
    }
    
    return dp[x][y]
}

for i in 0..<n{
    for j in 0..<n{
        result = max(result, dfs(i, j))
    }
}

print(result)