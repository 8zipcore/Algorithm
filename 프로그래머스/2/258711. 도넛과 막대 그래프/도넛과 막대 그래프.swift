import Foundation



func solution(_ edges:[[Int]]) -> [Int] {
    
    var result = [0, 0, 0, 0]
    
    var pointed: [Int: [Int]] = [:]
    var pointedBy: [Int : [Int]] = [:]
    
    for edge in edges {
        pointed[edge[0],default: []].append(edge[1])
        pointedBy[edge[1], default: []].append(edge[0])
        
        if pointed[edge[1]] == nil {
            pointed[edge[1]] = []
        }
    }
    // 정점 찾기
    if let vertax = pointed.sorted(by: { $0.value.count > $1.value.count }).filter({ pointedBy[$0.key] == nil }).first?.key,
       let pointedByVertex = pointed[vertax] {
        result[0] = vertax
        // 정점 제거
        pointed.removeValue(forKey: vertax)
        // 그래프 찾기
        pointed.forEach{
            if $0.value.count == 0 { // 막대는 가리키는 간선이 0개
                result[2] += 1
            } else if $0.value.count == 2 { // 8자는 가리키는 간선이 2개
                result[3] += 1
            }
        }
        // 도넛은 특정 되지 않아서 정점이 가리키는 노드 갯수에서 막대 + 8자를 빼주면 된다
        result[1] = pointedByVertex.count - result[2] - result[3]
    }
    
    return result
}