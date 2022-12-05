//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
struct CraneMove {
    let start: Int
    let end: Int
    let carry: Int
}

func mapScriptsToMove(_ input: String) -> [CraneMove] {
    var moves = [CraneMove]()
    input
        .components(separatedBy: "\n")
        .map {
            let simple = $0.components(separatedBy: " ")
                .compactMap { Int($0) }

            moves.append(CraneMove(start: simple[1],
                                   end: simple[2],
                                   carry: simple[0])
            )
        }
    return moves
}

func solutionOne(_ input: inout [[String]], move: String) -> String {
    let moves = mapScriptsToMove(move)
    moves.map {
        for _ in 0..<$0.carry {
            let item = input[$0.start].first!
            input[$0.start].remove(at: 0)
            input[$0.end].insert(item, at: 0)
        }
    }
    var ans = ""
    input.compactMap { $0.first}
        .map{ ans += $0 }
    return ans
}

func solutionTwo(_ input: inout [[String]], move: String) -> String {
    let moves = mapScriptsToMove(move)
    moves.map {
        var itemHolder = [String]()
        for _ in 0..<$0.carry {
            itemHolder.append(input[$0.start].first!)
            input[$0.start].remove(at: 0)
        }
        input[$0.end].insert(contentsOf: itemHolder, at: 0)
    }
    var ans = ""
    input.compactMap { $0.first}
        .map{ ans += $0 }
    return ans
}


solutionOne(&inputStack, move: inputMove)
solutionTwo(&inputStack, move: inputMove)
