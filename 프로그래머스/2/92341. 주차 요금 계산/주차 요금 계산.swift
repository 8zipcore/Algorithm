import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var cars: [Int: [Int]] = [:]
    var result: [Int : Int] = [:]
    
    records.forEach{
        let car = $0.split(separator: " ")
        cars[Int(car[1])!, default: []].append(timeToMinutes(time: String(car[0])))
    }
    
    cars.forEach{
        var arr = $0.value
        if arr.count % 2 != 0 {
            arr.append(1439)
        }
        
        var fee = fees[1]
        var overTime = 0
        for i in stride(from: 1, to: arr.count, by: 2).reversed(){
            overTime += arr[i] - arr[i - 1]
        }
        overTime -= fees[0]
        if overTime > 0{
            fee += Int(ceil(Double(overTime) / Double(fees[2]))) * fees[3]
        }
        result[$0.key] = fee
    }
        
    return result.sorted(by: { $0.key < $1.key }).map{
        return $0.value
    }
}

func timeToMinutes(time: String) -> Int{
    let arr = time.split(separator: ":")
    return Int(arr[0])! * 60 + Int(arr[1])!
}