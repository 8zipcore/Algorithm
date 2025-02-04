import Foundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    
    for i in 0..<n{
        var binaryArr1 = binaryArray(num: arr1[i], n: n)
        let binaryArr2 = binaryArray(num: arr2[i], n: n)
        let mapString = (0..<n).reduce(""){
            "\($0)\(binaryArr1[$1] == 1 || binaryArr2[$1] == 1 ? "#" : " ")"
        }
        answer.append(mapString)
    }
    
    return answer
}

func binaryArray(num: Int, n: Int) -> [Int]{
    var num = num
    var result: [Int] = Array(repeating: 0, count: n)
    var lastIndex = n - 1
    while num > 0{
        result[lastIndex] = num % 2
        num /= 2
        lastIndex -= 1
    }
    return result
}
