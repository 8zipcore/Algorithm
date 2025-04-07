import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    var result = 0
    
    let array: [Int] = queue1 + queue2
    var l = 0
    var r = queue1.count
    
    var sum1 = queue1.reduce(0){ $0 + $1 }
    var sum2 = queue2.reduce(0){ $0 + $1 }
    let goal = (sum1 + sum2) / 2
    
    if (sum1 + sum2) % 2 == 1 {
        return -1
    }
    
    if goal < queue1.max()! || goal < queue2.max()!{
        return -1
    }
    
    while r < array.count && l <= r {
        if sum1 < goal{
            sum1 += array[r]
            r += 1
        } else if sum1 > goal {
            sum1 -= array[l]
            l += 1
        } else {
            break
        }
        result += 1
    }
    
    if sum1 != goal {
        return -1
    }
    
    return result
}