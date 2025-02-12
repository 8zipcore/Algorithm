import Foundation

func solution(_ schedules:[Int], _ timelogs:[[Int]], _ startday:Int) -> Int {
    return schedules.indices.reduce(0){ answer, index in
        let minute = schedules[index] % 100 + 10
        let schedule = minute > 59 ? schedules[index] + 50 : schedules[index] + 10
        return answer + (timelogs[index].indices.filter{(($0 + startday - 1) % 7 + 1 < 6) && timelogs[index][$0] > schedule }.count == 0 ? 1 : 0)
    }
}
