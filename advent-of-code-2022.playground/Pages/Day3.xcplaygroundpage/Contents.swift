//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

func solutionOne(_ input: [String]) -> Int {
    let commentStrings: [Character] = input.map {
            $0.divide(into: 2)
            .commonElements
            .first!
    }
    return commentStrings.map {
        var value = $0.letterValue
        value += $0.isUppercase ? 26 : 0
        return value
    }.reduce(0, +)
}
solutionOne(input())

