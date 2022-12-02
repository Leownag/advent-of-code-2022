import Foundation
public let transformBase = base
    .components(separatedBy: "\n")
    .map { $0.components(separatedBy: " ") }
let base = """
A Y
B X
C Z
"""
