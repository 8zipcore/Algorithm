import Foundation

var result = 0

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    dungeons.indices.forEach{
        let dungeon = dungeons[$0]
        dfs(k - dungeon[1], dungeons, [$0 : true], 1)
    }
    
    return result
}

func dfs(_ k: Int, _ dungeons: [[Int]], _ visited: [Int: Bool], _ count: Int){
    result = max(result, count)
    
    if visited.count == dungeons.count {
        return
    }
    
    dungeons.indices.forEach{
        let dungeon = dungeons[$0]
        if visited[$0] == nil, k >= dungeon[0] {
            var visited = visited
            visited[$0] = true
            dfs(k - dungeon[1], dungeons, visited, count + 1)
        }
    }
}