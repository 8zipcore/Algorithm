import Foundation

if let count = Int(readLine()!){
    var atm: [Int] = []
    atm.append(contentsOf: readLine()!.components(separatedBy: " ").map{ return Int($0)!})
    
    atm.sort()
    
    var result:[Int] = [atm[0]]
    
    for i in 1..<atm.count{
        result.append(result[i - 1] + atm[i])
    }
    
    print(result.reduce(0){ $0 + $1 })
}