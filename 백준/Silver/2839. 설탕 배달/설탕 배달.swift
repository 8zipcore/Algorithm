import Foundation

if let count = Int(readLine()!){
    var div = count / 5
    
    while div > 0 {
        if div > 0, (count - (div) * 5) % 3 == 0 {
            print(div + (count - (div) * 5) / 3)
            break
        }
        div -= 1
    }
    
    if div < 1 {
        if count % 3 == 0 {
            print(count / 3)
        } else {
            print("-1")
        }
    }
}