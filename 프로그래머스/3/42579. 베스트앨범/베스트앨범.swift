import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var musicPlays: [String : [Int : Int]] = [:]
    var genrePlays: [String : Int] = [:]
    var result: [Int] = []
    
    genres.indices.forEach{
        let genre = genres[$0]
        genrePlays[genre, default: 0] += plays[$0]
        musicPlays[genre, default: [:]][$0] = plays[$0]
    }
    
    genrePlays.sorted { $0.value > $1.value }.forEach{
        if let musicPlays = musicPlays[$0.key]{
            musicPlays.sorted{ $0.value > $1.value }.prefix(musicPlays.count > 1 ? 2 : musicPlays.count).forEach{
                result.append($0.key)
            }
        }
    }
    
    return result
}