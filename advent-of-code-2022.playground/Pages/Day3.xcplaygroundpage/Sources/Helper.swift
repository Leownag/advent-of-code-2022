import Foundation

public extension Character {

    static let alphabetSet = Array("abcdefghijklmnopqrstuvwxyz")

    var uppercased: Character {
        uppercased().first!
    }

    var lowercased: Character {
        lowercased().first!
    }

    var isUppercase: Bool {
        uppercased == self
    }

    var letterValue: Int {
        guard isLetter else { fatalError("isNotAlphabet")}
        return Character.alphabetSet.firstIndex(of: self.lowercased)! + 1
    }
}

public extension String {
    var firstCharacter: Character {
        guard !self.isEmpty else { return " " }
        return self.first!
    }
}

public extension Collection where Element: Collection, Element.Element: Hashable {
    var commonElements: Set<Element.Element> {
        if self.isEmpty { return [] }
        var commonSet = Set(self.first!)
        for other in self.dropFirst() {
            commonSet.formIntersection(other)
        }
        return commonSet
    }
}

public extension Collection {
    func divide(into count: Int) -> Array<SubSequence> {
        let (sliceLength, _) = self.count.quotientAndRemainder(dividingBy: count)

        return (0 ..< count).map { slice in
            let start = self.index(startIndex, offsetBy: slice * sliceLength)
            if slice < count - 1 {
                let end = self.index(start, offsetBy: sliceLength)
                return self[start ..< end]
            } else {
                return self[start...]
            }
        }

    }
}
