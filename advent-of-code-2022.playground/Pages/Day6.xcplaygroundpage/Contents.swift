//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
func solution(_ input: String, lenth: Int) -> Int {
    var counter = 0
    var targetCase = Set(Array(input)[counter..<lenth])
    while targetCase.count != lenth {
        counter += 1
        targetCase = Set(Array(input)[counter..<lenth + counter])
    }

    return counter + lenth
}
solution(input, lenth: 4)
solution(input, lenth: 14)
