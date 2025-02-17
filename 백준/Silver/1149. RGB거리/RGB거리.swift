import Foundation

if let count = Int(readLine()!){
    var rgbArr: [[Int]] = [[0,0,0]]
    
    for _ in 1...count{
        let rgb = readLine()!.components(separatedBy: " ").map{ return Int($0)!}
        rgbArr.append(rgb)
    }
    
    var dp = Array(repeating: Array(repeating: 0, count: 3), count: count + 1)
    
    for i in 1..<dp.count{
        dp[i][0] = min(dp[i - 1][1], dp[i - 1][2]) + rgbArr[i][0]
        dp[i][1] = min(dp[i - 1][0], dp[i - 1][2]) + rgbArr[i][1]
        dp[i][2] = min(dp[i - 1][0], dp[i - 1][1]) + rgbArr[i][2]
    }
    
    print(dp[count].min()!)
}