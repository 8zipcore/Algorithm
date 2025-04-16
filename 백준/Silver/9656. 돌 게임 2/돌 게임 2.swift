import Foundation

// 백준 9656 돌 게임 2

let n = Int(readLine()!)!

if n == 1 {
    print("CY")
} else {
    if (n / 3) % 2 == 0{
        if n % 3 == 1 {
            print("CY")
        } else {
            print("SK")
        }
    } else {
        if n % 3 == 1 {
            print("SK")
        } else {
            print("CY")
        }
    }
}