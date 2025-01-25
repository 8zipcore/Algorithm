import Foundation

func solution(_ topping:[Int]) -> Int {
    var answer = 0
    
    var cheolDic: [Int : Int] = [:]
    var broDic: [Int : Int] = [:]
    
    topping.forEach{
        cheolDic[$0] = cheolDic[$0] == nil ? 1 : cheolDic[$0]! + 1
    }
    
    topping.forEach{
        broDic[$0] = broDic[$0] == nil ? 1 : broDic[$0]! + 1
        if cheolDic[$0] == 1{
            cheolDic.removeValue(forKey: $0)
        } else {
            cheolDic[$0] = cheolDic[$0]! - 1
        }
        
        if broDic.count == cheolDic.count {
            answer += 1
        }
    }
    
    return answer
}
