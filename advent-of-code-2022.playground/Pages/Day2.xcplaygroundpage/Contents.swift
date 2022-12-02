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


func solutionOne(_ input: [[String]]) -> Int {
    var point = 0
    input.map {
        let elf = Shape.getShape($0[0])
        let cheater = Shape.getShape($0[1])
        point += cheater.point
        point += judgeGame(elf, cheater).point
    }

    return point
}

func solutionTwo(_ input: [[String]]) -> Int {
    var point = 0
    input.map {
        let elf = Shape.getShape($0[0])
        let cheaterState = GameState.getState($0[1])
        point += cheaterState.point

        point += judgeShape(elf, cheaterState).point
    }

    return point
}

func judgeGame(_ competitorMove: Shape, _ mineMove: Shape) -> GameState {
    guard competitorMove != mineMove else { return .draw }
    return mineMove == getWin(competitorMove) ? .win : .lose
}

func judgeShape(_ competitorMove: Shape, _ state: GameState) -> Shape {
    guard state != .draw else { return competitorMove }
    switch state {
    case .win:
        return getWin(competitorMove)
    case .lose:
        return getLose(competitorMove)
    default:
        fatalError("Never")
    }
}

private func getWin(_ competitorMove: Shape) -> Shape {
    switch competitorMove {
    case .scissors:
        return .rock
    case .rock:
        return .paper
    case .paper:
        return .scissors
    }
}

private func getLose(_ competitorMove: Shape) -> Shape {
    switch competitorMove {
    case .scissors:
        return .paper
    case .rock:
        return .scissors
    case .paper:
        return .rock
    }
}
solutionOne(transformInput)
solutionTwo(transformInput)
//: [Next](@next)
