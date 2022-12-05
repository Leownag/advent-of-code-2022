//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)


extension String  {
    func forceToRange() -> ClosedRange<Int> {
        let array = self.components(separatedBy: "-")
        return Int(array.first!)!...Int(array.last!)!
    }
}

func compareIsContain(_ input: [String]) -> Bool {
    guard input.count == 2 else { return false }
    let firstSet = input[0].forceToRange()
    let secondSet = input[1].forceToRange()

    let isContain = firstSet.contains(secondSet) || secondSet.contains(firstSet)

//    print(firstSet, secondSet, isContain)

    return isContain
}

func compareIsOverlap(_ input: [String]) -> Bool {
    guard input.count == 2 else { return false }
    let firstSet = input[0].forceToRange()
    let secondSet = input[1].forceToRange()

    let isOverlap = firstSet.overlaps(secondSet)

//    print(firstSet, secondSet, isOverlap)

    return isOverlap
}
func solutionOne(_ input: String) -> Int {
    var ans = 0
    let sets = input
        .components(separatedBy: "\n")
        .map {
            $0.components(separatedBy: ",")
        }
    sets.map {
        ans += compareIsContain($0) ? 1 : 0
    }

    return ans
}

func solutionTwo(_ input: String) -> Int {
    var ans = 0
    let sets = input
        .components(separatedBy: "\n")
        .map {
            $0.components(separatedBy: ",")
        }
    sets.map {
        ans += compareIsOverlap($0) ? 1 : 0
    }

    return ans
}


solutionOne(inputData)
solutionTwo(inputData)
