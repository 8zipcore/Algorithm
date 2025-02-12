import Foundation

func solution(_ friends:[String], _ gifts:[String]) -> Int {

    var give: [String : Int] = [:]
    var receive: [String : Int] = [:]
    var giftFriend: [String : Int] = [:]
    
    for friend in friends {
        for gift in gifts{
            let giftArr = gift.components(separatedBy: " ")
            let giver = giftArr[0]
            let receiver = giftArr[1]
            
            give[giver, default: 0] += 1
            receive[receiver, default: 0] += 1
            giftFriend[gift, default: 0] += 1
        }
    }
    
    var result = 0
    
    for i in friends.indices{
        let friend1 = friends[i]
        var count = 0
        for j in friends.indices {
            if i != j {
                let friend2 = friends[j]
                let f1tof2 = giftFriend["\(friend1) \(friend2)", default: 0]
                let f2tof1 = giftFriend["\(friend2) \(friend1)", default: 0]
                
                if f1tof2 > f2tof1{
                    count += 1
                } else if f1tof2 == f2tof1 {
                    if give[friend1, default: 0] - receive[friend1, default: 0] > give[friend2, default: 0] - receive[friend2, default: 0]{
                        count += 1
                    }
                }
            }
        }
        result = max(result, count)
    }
    return result
}