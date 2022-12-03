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

func solutionTwo(_ input: [String]) -> Int {
    let elfGroups = input.divide(into: input.count / 3)
    let groupBadges: [Character] = elfGroups.map {
        return $0.commonElements
            .first!
    }
    return groupBadges.map {
        var value = $0.letterValue
        value += $0.isUppercase ? 26 : 0
        return value
    }.reduce(0, +)
}

solutionOne(input())
solutionTwo(input())
