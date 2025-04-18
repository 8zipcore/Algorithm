import Foundation

var arr: [[Int]] = []

func solution(_ n:Int, _ q:[[Int]], _ ans:[Int]) -> Int {
    // 조합으로 갯수만큼 뽑기
    var m = 0
    var numArr = (1...n).map{ return $0 }
    var col = q[0].count
    var count = numArr.count - col + 1
    for i in 0..<count{
        dfs(i + 1, numArr, [numArr[i]], col)
    }
    // 하나하나 조건 부합 확인하기
    arr.forEach{
        var num: [Int: Bool] = [:]
        $0.forEach{
            num[$0] = true
        }
        var result = 0
        
        for i in q.indices{
            var ans = ans[i]
            var count = 0
            
            for j in 0..<col{
                if num[q[i][j]] == true {
                    count += 1
                }
                if count > ans {
                    break
                }
            }
            
            if count == ans {
                result += 1
            }
        }
        
        if result == q.count {
            m += 1
        }
    }
     
    return m
}

func dfs(_ i: Int, _ numArr: [Int], _ visited: [Int], _ count: Int){
    if visited.count == count {
        arr.append(visited)
    } else {
        for j in i..<numArr.count{
            var visited = visited
            visited.append(numArr[j])
            dfs(j + 1, numArr, visited, count)
        }
    }
}