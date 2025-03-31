import Foundation

func solution(_ players:[Int], _ m:Int, _ k:Int) -> Int {
    
    var severs: [Int] = Array(repeating: 0, count: players.count)
    var result = 0
    var k = k - 1
    
    players.indices.forEach{ time in
        if players[time] >= (severs[time] + 1) * m {
            let sever = max((players[time] - (severs[time] * m)) / m, 1)
            var count = (time + k < players.count) ? (time + k) : (players.count - 1)
            for i in time...count{
                severs[i] += sever
            }
            result += sever
        }
    }
    return result
}