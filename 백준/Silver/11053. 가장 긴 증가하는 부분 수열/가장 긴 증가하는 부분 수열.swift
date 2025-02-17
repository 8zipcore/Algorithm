import Foundation

if let count = Int(readLine()!){
    var numArr: [Int] = []
    numArr.append(contentsOf: readLine()!.components(separatedBy: " ").map{ return Int($0)!})
    
    var arr: [[Int]] = [[1]]
    var result = 1
    
    for i in 1..<numArr.count{
        var maxCount = 0
        for j in 0..<i{
            if numArr[j] < numArr[i]{
                maxCount = max(maxCount, arr[j][0])
            }
        }
        arr.append([maxCount + 1])
        result = max(result, maxCount + 1)
    }
    
    print(result)
}