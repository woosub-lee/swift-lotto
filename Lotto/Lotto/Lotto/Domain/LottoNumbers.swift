//
//  LottoNumbers.swift
//  Lotto
//
//  Created by 이우섭 on 2022/05/18.
//

import Foundation

class LottoNumbers {
    private var numbers: [LottoNumber]
    
    var count: Int {
        return numbers.count
    }
    
    var comparativeSet: Set<Int> {
        return Set<Int>(numbers.map({ $0.value }))
    }
    
    init(_ numbers: [LottoNumber]) {
        self.numbers = numbers
    }
    
    static func generateByRandom() -> LottoNumbers {
        var randomPool = Set<Int>(1...45)
        var numbers = [Int]()
        
        for _ in 0..<6 {
            let randomNumber = randomPool.exportRandomElement()!
            numbers.append(randomNumber)
        }
        return LottoNumbers(numbers.compactMap(LottoNumber.init))
    }
}


extension Set {
    mutating func exportRandomElement() -> Element? {
        guard let element = self.randomElement() else { return nil }
        self.remove(element)
        return element
    }
}
