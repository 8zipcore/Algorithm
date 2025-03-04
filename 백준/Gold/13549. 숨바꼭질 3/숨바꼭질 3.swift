import Foundation

// 백준 13549 숨바꼭질 3

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], k = input[1]
if n >= k {
    print(n - k)
} else {
    var queue: [(Int, Int)] = []
    var visited = Array(repeating: false, count: 100001)
    
    queue.append((n, 0))
    
    while !queue.isEmpty{
        let pop = queue.removeFirst()
        if pop.0 == k {
            print(pop.1)
            break
        }
        if pop.0 * 2 < 100001 && !visited[pop.0 * 2]{
            visited[pop.0 * 2] = true
            queue.append((pop.0 * 2, pop.1))
        }
        
        if pop.0 - 1 >= 0 && !visited[pop.0 - 1]{
            visited[pop.0 - 1] = true
            queue.append((pop.0 - 1, pop.1 + 1))
        }
        
        if pop.0 + 1 < 100001 && !visited[pop.0 + 1]{
            visited[pop.0 + 1] = true
            queue.append((pop.0 + 1, pop.1 + 1))
        }
        
        
    }
}