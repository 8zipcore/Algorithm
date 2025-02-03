import Foundation

func solution(_ str1:String, _ str2:String) -> Int {
    var answer = 0
    let str1Arr = Array(str1)
    let str2Arr = Array(str2)
    
    var map1: [String : Int] = [:]
    var map2: [String : Int] = [:]
    var unionMap: [String : Int] = [:]
    var intersection = 0
    var union = 0

    for i in 0..<(str1Arr.count - 1){
        if str1Arr[i].isLetter && str1Arr[i+1].isLetter{
            map1["\(str1Arr[i].uppercased())\(str1Arr[i+1].uppercased())", default: 0] += 1
        }
    }
    
    unionMap = map1

    for i in 0..<(str2Arr.count - 1){
        if str2Arr[i].isLetter && str2Arr[i+1].isLetter{
            map2["\(str2Arr[i].uppercased())\(str2Arr[i+1].uppercased())", default: 0] += 1
            unionMap["\(str2Arr[i].uppercased())\(str2Arr[i+1].uppercased())", default: 0] += 1
        }
    }
    
    map1.forEach{
        if let map2Value = map2[$0.key]{
            intersection += min($0.value, map2Value)
        }
    }
    
    if unionMap.count == 0 {
        return 65536
    }
    
    union = unionMap.reduce(0){ $0 + $1.value } - intersection
    
    return Int(Double(intersection) / Double(union) * 65536)
}