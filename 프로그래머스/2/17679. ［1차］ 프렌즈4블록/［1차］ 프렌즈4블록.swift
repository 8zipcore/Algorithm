import Foundation

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    
    struct BlockPoint: Hashable, Equatable{
        var x: Int
        var y: Int
        
        static func == (lhs: Self, rhs: Self) -> Bool{
            return lhs.x == rhs.x && lhs.y == rhs.y
        }
    }
    
    var blockArr: [[String]] = board.map{
        return Array($0).map{ return String($0)}
    }
    
    var flag: Bool = true
    var result = 0
    var arr = blockArr
    
    while flag {
        flag = false
        
        var i = 1
        var j = 1
        
        var blockDic: [BlockPoint : Bool] = [:]
        
        while i < m && j < n {
            let block = arr[i][j]
            
            if block != "0" {
                let topBlock = arr[i - 1][j]
                let leftBlock = arr[i][j - 1]
                let leftTopBlock = arr[i - 1][j - 1]
                
                if block == topBlock && block == leftBlock && leftBlock == leftTopBlock{
                    blockDic[BlockPoint(x: i, y: j - 1)] = true
                    blockDic[BlockPoint(x: i - 1, y: j - 1)] = true
                    blockDic[BlockPoint(x: i, y: j)] = true
                    blockDic[BlockPoint(x: i - 1, y: j)] = true
                    flag = true
                }
            }
            
            j += 1
            
            if j == n{
                i += 1
                j = 1
            }
        }

        blockArr = arr
        arr = Array(repeating: Array(repeating: "0", count: n), count: m)
        for j in (0..<n).reversed(){
            var index = m - 1
            for i in(0..<m).reversed(){
                if blockDic[BlockPoint(x: i, y: j)] == nil{
                    arr[index][j] = blockArr[i][j]
                    index -= 1
                }
            }
        }
        
        result += blockDic.count
    }
    
    return result
}
