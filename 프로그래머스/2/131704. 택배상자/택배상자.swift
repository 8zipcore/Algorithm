import Foundation

func solution(_ order:[Int]) -> Int {
    var index = 0
    var stack: [Int] = []
    var num = 1
    
    while index < order.count {
        if order[index] == num{
            index += 1
            num += 1
        } else if let box = stack.last, order[index] == box{
            stack.removeLast()
            index += 1
        } else {
            if order[index] >= num{
                stack.append(num)
                num += 1
            } else {
                break
            }
        }
    }
    
    return index
}