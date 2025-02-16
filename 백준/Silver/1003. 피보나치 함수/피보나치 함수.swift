import Foundation

if let count = Int(readLine()!){
    var inputNum: [Int] = []
    var map:[(Int, Int)] = []
    
    for _ in 1...count{
        inputNum.append(Int(readLine()!)!)
    }
    
    map.append((1,0)) // 0일 때
    map.append((0,1)) // 1일 때
    
    for i in 2...41{
        map.append((map[i - 1].0 + map[i - 2].0, map[i - 1].1 + map[i - 2].1 ))
    }
    
    inputNum.forEach{
        print("\(map[$0].0) \(map[$0].1)")
    }
}
