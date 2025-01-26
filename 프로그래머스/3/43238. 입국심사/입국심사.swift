import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    var minTime: Int64 = times.reduce(Int64(times[0])){ min($0, Int64($1)) }
    var start: Int64 = minTime
    var end: Int64 = minTime * Int64(n) // 최악의 경우, 최소시간 심사대에서만 심사받을 때
    
    while start <= end {
        let mid = (start + end) / 2
        var people: Int64 = 0
        
        for time in times{
            people += mid / Int64(time)
            
            if people >= n {
                minTime = mid
                end = mid - 1
            }
        }
        
        if people < n {
            start = mid + 1
        }
    }
    
    return minTime
}