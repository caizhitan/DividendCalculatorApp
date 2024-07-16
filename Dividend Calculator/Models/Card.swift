import Foundation

struct Card: Identifiable, Codable {
    let id: UUID
    var tickerTitle: String
    var investmentAmt: Double {
        didSet {
            computeIncomeAmt()
        }
    }
    var avgYield: Double
    var avgYtdYield: Double {
        didSet {
            computeIncomeAmt()
        }
    }
    var incomeAmt: Double = 0.0
    
    init(id: UUID = UUID(), tickerTitle: String, investmentAmt: Double, avgYield: Double, avgYtdYield: Double) {
        self.id = id
        self.tickerTitle = tickerTitle
        self.investmentAmt = investmentAmt
        self.avgYield = avgYield
        self.avgYtdYield = avgYtdYield
        self.computeIncomeAmt()
    }
    
    private mutating func computeIncomeAmt() {
        incomeAmt = investmentAmt * avgYtdYield / 100
    }
}
