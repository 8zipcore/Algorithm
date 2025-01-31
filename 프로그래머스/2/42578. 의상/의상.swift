import Foundation

func solution(_ clothes:[[String]]) -> Int {
    
    var map: [String: Int] = [:]
    
    clothes.forEach{ cloth in
        map[cloth[1], default: 1] += 1
    }
    
    return max(map.reduce(1){ $0 * $1.value } - 1, 1)
}