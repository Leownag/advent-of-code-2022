//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

enum GameState {
    case win
    case lose
    case draw

    var point: Int {
        switch self {
        case .win:
            return 6
        case .lose:
            return 0
        case .draw:
            return 3
        }
    }
    static func getState(_ sign: String) -> GameState {
        switch sign {
        case "X":
            return .lose
        case "Y":
            return .draw
        case "Z":
            return .win
        default:
            fatalError("Never")
        }
    }

}

enum Shape: Equatable {
    case rock
    case paper
    case scissors

    var point: Int {
        switch self {
        case .rock:
            return 1
        case .paper:
            return 2
        case .scissors:
            return 3
        }
    }

    static func getShape(_ sign: String) -> Shape {
        switch sign {
        case "X", "A":
            return .rock
        case "Y", "B":
            return .paper
        case "Z", "C":
            return .scissors
        default:
            fatalError("Never")
        }
    }
}

func solutionOne(_ input: String) -> Int {
    var point = 0

    let transformInput = input
        .components(separatedBy: "\n")
        .map {
            $0.components(separatedBy: " ")
        }
    transformInput.map {
        let elf = Shape.getShape($0[0])
        let cheater = Shape.getShape($0[1])
        point += cheater.point
        point += judgeGame(elf, cheater).point
    }

    return point
}

func solutionTwo(_ input: String) -> Int {
    var point = 0

    let transformInput = input
        .components(separatedBy: "\n")
        .map {
            $0.components(separatedBy: " ")
        }
    transformInput.map {
        let elf = Shape.getShape($0[0])
        let cheaterState = GameState.getState($0[1])
        point += cheaterState.point

        point += judgeShape(elf, cheaterState).point
    }

    return point
}
func judgeGame(_ competitorMove: Shape, _ mineMove: Shape) -> GameState {
    guard competitorMove != mineMove else { return .draw }
    switch (competitorMove, mineMove) {
    case (.paper, .scissors):
        return .win
    case (.scissors, .rock):
        return .win
    case (.rock, .paper):
        return .win

    case (.paper, .rock):
        return .lose
    case (.scissors, .paper):
        return .lose
    case (.rock, .scissors):
        return .lose
    default:
        fatalError("Never")
    }
}

func judgeShape(_ competitorMove: Shape, _ state: GameState) -> Shape {
    guard state != .draw else { return competitorMove }
    switch (competitorMove, state) {
    case (.paper, .win):
        return .scissors
    case (.scissors, .win):
        return .rock
    case (.rock, .win):
        return .paper

    case (.paper, .lose):
        return .rock
    case (.scissors, .lose):
        return .paper
    case (.rock, .lose):
        return .scissors
    default:
        fatalError("Never")
    }
}
solutionOne(input)
solutionTwo(input)
//: [Next](@next)
