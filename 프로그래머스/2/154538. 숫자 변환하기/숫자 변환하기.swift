import Foundation

func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {
    if x == y { return 0 }
    
    var result = 0
    var set: Set<Int> = [x]
    var flag = false
    
    while set.count > 0 && !flag {
        var newSet: Set<Int> = []
        
        result += 1
        
        for num in set{
            if num + n == y || num * 2 == y || num * 3 == y {
                flag = true
                break
            }
            
            if num + n < y {
                newSet.insert(num + n)
            }
            if num * 2 < y {
                newSet.insert(num * 2)
            }
            if num * 3 < y {
                newSet.insert(num * 3)
            }
        }
        
        set = newSet
    }
    
    return flag ? result : -1
}