import Foundation

if let count = Int(readLine()!){
    var inputArr: [Int] = []
    for _ in 1...count{
        inputArr.append(Int(readLine()!)!)
    }
    var arr: [Int] = Array(repeating: 0, count: 12)
    arr[1] = 1
    arr[2] = 2
    arr[3] = 4
    arr[4] = 7
    
    for i in 5..<arr.count{
        arr[i] = arr[i - 1] + arr[i - 2] + arr[i - 3]
    }
    
    inputArr.forEach{
        print(arr[$0])
    }
}