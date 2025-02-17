import Foundation

if let count = Int(readLine()!){
    var floorArr: [Int] = []
    var roomArr: [Int] = []
    
    for _ in 1...count{
        floorArr.append(Int(readLine()!)!)
        roomArr.append(Int(readLine()!)!)
    }
    
    var maxFloor = 15
    
    var aptArr: [[Int]] = Array(repeating: Array(repeating: 0, count: maxFloor), count: maxFloor)
    
    for i in 0..<maxFloor{
        aptArr[0][i] = i
    }
    
    for i in 1..<maxFloor{
        aptArr[i][0] = aptArr[i - 1][0]
        for j in 1..<maxFloor{
            aptArr[i][j] = aptArr[i][j - 1] + aptArr[i - 1][j]
        }
    }
    
    floorArr.indices.forEach{
        print(aptArr[floorArr[$0]][roomArr[$0]])
    }
}