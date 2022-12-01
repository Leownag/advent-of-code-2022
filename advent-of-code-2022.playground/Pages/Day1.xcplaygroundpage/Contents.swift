//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

func solutionOne(_ input: String) -> Int {
    let elfsStock = input
        .components(separatedBy: "\n")
        .split(separator: "")
        .map{ $0.map {
            Int($0) ?? 0
        }}
        .map { $0.reduce(0, +) }
        .max()
    return elfsStock ?? 0
}

solutionOne(input)

func solutionTwo(_ input: String) -> Int {
    let elfsStock = input
        .components(separatedBy: "\n")
        .split(separator: "")
        .map{ $0.map {
            Int($0) ?? 0
        }}
        .map { $0.reduce(0, +) }
        .sorted{ $0 > $1 }

    var ans = 0
    for i in 0...2 {
        ans += elfsStock[i]
    }
    return ans
}

solutionTwo(input)
