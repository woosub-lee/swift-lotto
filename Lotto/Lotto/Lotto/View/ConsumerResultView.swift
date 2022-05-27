//
//  ConsumerResultView.swift
//  Lotto
//
//  Created by 이우섭 on 2022/05/24.
//

import Foundation

struct ConsumerResultView {
    
    func printLottos(of consumer: LottoConsumer) {
        print("\(consumer.lottos.count)개를 구매했습니다.")
        consumer.lottos.forEach {
            printLottoDescription(for: $0)
        }
        print()
    }
    
    func printStatistics(of prizes: [Prize]) {
        print("당첨 통계")
        print("---------")
        
        for matchNumber in 3...6 {
            let printedPrize = Prize.getPrize(by: matchNumber)
            print("\(matchNumber)개 일치 (\(printedPrize.rawValue)원)- \(prizes.filter({ $0 == printedPrize }).count)개")
        }
    }
    
    func printPrizeRatio(of consumer: LottoConsumer, totalPrizeMoney: Int) {
        print("총 수익율은 \(consumer.getRatio(of: totalPrizeMoney))입니다.")
    }
    
    private func printLottoDescription(for lotto: Lotto) {
        let numbers = lotto.description
        print(numbers)
    }
}
