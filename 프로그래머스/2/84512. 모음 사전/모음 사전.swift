import Foundation

func solution(_ word: String) -> Int {
    let vowels = ["A", "E", "I", "O", "U"]
    let values = [781, 156, 31, 6, 1]  // 자리별 가중치 계산 (5^4 + 5^3 + ...)

    var result = 0

    for (index, char) in word.enumerated() {
        if let vowelIndex = vowels.firstIndex(of: String(char)) {
            result += vowelIndex * values[index] + 1
        }
    }

    return result
}
