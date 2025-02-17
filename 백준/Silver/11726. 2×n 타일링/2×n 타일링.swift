import Foundation

if let count = Int(readLine()!){
    var arr: [Int] = Array(repeating: 0, count: count + 2)
    arr[1] = 1
    arr[2] = 2
    
    for i in 3..<arr.count{
        arr[i] = (arr[i - 1] + arr[i - 2]) % 10007
    }
    
    print(arr[count])
}