//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2022 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//

extension String {
  func withFirstLetterUppercased() -> String {
    if let firstLetter = self.first {
      return firstLetter.uppercased() + self.dropFirst()
    } else {
      return self
    }
  }

  func replacingFirstOccurence(of character: Character, with replacement: Character) -> String {
    guard let match = self.firstIndex(of: character) else {
      return self
    }
    return self[startIndex..<match] + String(replacement) + self[index(after: match)...]
  }

  func replacingLastOccurence(of character: Character, with replacement: Character) -> String {
    guard let match = self.lastIndex(of: character) else {
      return self
    }
    return self[startIndex..<match] + String(replacement) + self[index(after: match)...]
  }
}

extension Collection {
  /// If the collection contains a single element, return it, otherwise `nil`.
  var only: Element? {
    if !isEmpty && index(after: startIndex) == endIndex {
      return self.first!
    } else {
      return nil
    }
  }
}
