import Foundation

struct Flight{
    var list: [String]
    var departure: String {
        return list.last!
    }
    var visited: [Int : Bool] = [:]
}

func solution(_ tickets:[[String]]) -> [String] {
    return bfs(tickets)
}

func bfs(_ tickets: [[String]]) -> [String]{
    var queue: [Flight] = []
    var newFlightArray: [Flight] = []
    
    var result: [String] = []
    
    for i in 0..<tickets.count{
        let departure = tickets[i][0]
        let destination = tickets[i][1]
        
        if departure == "ICN"{
            let flight = Flight(list: ["ICN", destination], visited: [i : true])
            newFlightArray.append(flight)
        }
    }
    
    queue.append(contentsOf: newFlightArray.sorted(by: {$0.departure < $1.departure }))
    
    while result.count == 0{
        var node = queue.removeFirst()
        
        if node.visited.count == tickets.count{
            result = node.list
            break
        }
        
        newFlightArray = []
        
        for i in 0..<tickets.count{
            let departure = tickets[i][0]
            let destination = tickets[i][1]
            
            if departure == node.departure && node.visited[i] == nil{
                var newNode = node
                newNode.list.append(destination)
                newNode.visited[i] = true
                newFlightArray.append(newNode)
            }
        }
        
        newFlightArray.sorted(by: { $0.departure > $1.departure }).forEach{
            queue.insert($0, at: 0)
        }
    }
    return result
}