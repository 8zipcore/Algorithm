import Foundation

if let n = Int(readLine()!){
    var arr: [Int] = [0]
    arr.append(contentsOf: readLine()!.components(separatedBy:" ").map{ return Int($0)!})
    
    var dp: [Int] = Array(repeating: 0, count: n + 1)
    var result = -1000
    
    for i in 1..<arr.count{
        dp[i] = max(dp[i - 1] + arr[i], arr[i])
        result = max(dp[i], result)
    }
    
    print(result)
}