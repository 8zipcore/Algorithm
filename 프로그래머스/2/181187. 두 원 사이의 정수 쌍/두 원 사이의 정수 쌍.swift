import Foundation

func solution(_ r1:Int, _ r2:Int) -> Int64 {
    
    var r1PointNum = 0
    var r2PointNum = 0
    
    for x in 1..<r1{
        r1PointNum += pointNum(Double(x),Double(r1), true)
    }
    
    for x in 1..<r2{
        r2PointNum += pointNum(Double(x),Double(r2), false)
    }
    
    return Int64((r2PointNum - r1PointNum) * 4 + (r2 - r1 + 1) * 4)
}

func pointNum(_ a:Double, _ c:Double, _ isR1:Bool) -> Int{
    let b = sqrt(pow(c, 2) - pow(a, 2))
    if isR1 {
        if Int(exactly: b) != nil{
            return Int(b) - 1
        }
    }
    return Int(b)
}