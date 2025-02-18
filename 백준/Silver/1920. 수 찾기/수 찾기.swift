import Foundation

if let count = Int(readLine()!){
    var originDic: [Int : Bool] = [:]
    readLine()!.components(separatedBy: " ").forEach{
        originDic[Int($0)!] = true
    }
    
    let inputArrCount = Int(readLine()!)!
    var result: [Int] = []
    
    readLine()!.components(separatedBy: " ").map{ return Int($0)! }.forEach{
        result.append(originDic[$0] == nil ? 0 : 1)
    }
    
    result.forEach{
        print($0)
    }
}