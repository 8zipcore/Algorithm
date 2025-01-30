func solution(_ storey: Int) -> Int {
    var storey = storey
    var result = 0
    
    while storey > 0 {
        let remainder = storey % 10 // 현재 자릿수 (1의 자리)
        storey /= 10 // 다음 자릿수로 이동
        
        if remainder > 5 {
            // 현재 자릿수가 5보다 크면 올림
            result += 10 - remainder
            storey += 1
        } else if remainder == 5 {
            // 현재 자릿수가 5면 다음 자릿수를 확인
            if storey % 10 >= 5 {
                result += 10 - remainder
                storey += 1
            } else {
                result += remainder
            }
        } else {
            // 현재 자릿수가 5보다 작으면 내림
            result += remainder
        }
    }
    
    return result
}