import Foundation

let firstLine = readLine()!.components(separatedBy: " ").map{Int(String($0))!}
let n = firstLine[0]
let m = firstLine[1]
var panelArr: [[String]] = []
var answer = 0

for _ in 1...n{
  let line = readLine()!.map{String($0)}
  panelArr.append(line)
}

var dp = Array(repeating: Array(repeating: 0, count: m), count: n)
for i in 0..<n{
  for j in 0..<m{
    if panelArr[i][j] == "-"{
      if j < m - 1 && panelArr[i][j + 1] == "|" || j == m - 1 && panelArr[i][j] == "-"{
        answer += 1
      }
    }else if panelArr[i][j] == "|"{
      if i < n - 1 && panelArr[i + 1][j] == "-" || i == n - 1 && panelArr[i][j] == "|"{
        answer += 1
      }
    }
  }
}

print(answer)