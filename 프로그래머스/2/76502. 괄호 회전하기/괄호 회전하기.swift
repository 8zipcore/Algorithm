import Foundation

func solution(_ s:String) -> Int {
    var sArr = Array(s).map{ return String($0) }
    var count = sArr.count
    var answer = 0
    
    for i in 0..<count{
        var stack: [String] = []
        stack.append(sArr.first!)
        for i in 1..<count{
            let ch = sArr[i]
            if stack.last == "[" && ch == "]" ||
                stack.last == "(" && ch == ")" ||
                stack.last == "{" && ch == "}" {
                stack.removeLast()
            } else {
                stack.append(ch)
            }
        }
        
        if stack.isEmpty{
            answer += 1
        }
        
        sArr.append(sArr.removeFirst())
    }
    
    return answer
}