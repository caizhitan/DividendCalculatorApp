import SwiftUI
import UIKit

struct ContentView: View {
    @State private var showAddCardView = false
    @State private var cards: [Card] = [] {
        didSet {
            FileManagerHelper.shared.saveCards(cards)
        }
    }
    
    @State private var showEditCardView = false
    @State private var currentEditingIndex: Int?
    
    var totalInvestment: Double {
        cards.reduce(0) { $0 + $1.investmentAmt }
    }
    
    var totalIncome: Double {
        cards.reduce(0) { $0 + $1.incomeAmt }
    }
    
    var totalAvgYield: Double {
        guard totalInvestment > 0 else { return 0 }
        return cards.reduce(0) { $0 + ($1.investmentAmt * $1.avgYield) } / totalInvestment
    }
    
    var totalAvgYtdYield: Double {
        guard totalInvestment > 0 else { return 0 }
        return cards.reduce(0) { $0 + ($1.investmentAmt * $1.avgYtdYield) } / totalInvestment
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    AddButton(action: {
                        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .medium)
                        impactFeedbackgenerator.impactOccurred()
                        showAddCardView = true
                    })
                    .padding(.trailing, 16)
                }
                
                VStack(alignment: .leading) {
                    Text("Overall")
                        .font(.system(size: 32, weight: .bold))
                        .padding(.bottom, 8)
                    
                    InvestmentTotal(totalInvestment: totalInvestment)
                    YearlyIncome(yearlyIncome: totalIncome)
                }
                .padding(.leading, 16)
                
                HStack {
                    MiniCardView(title: "Total Avg Yield", value: totalAvgYield)
                    Spacer()
                    MiniCardView(title: "Total Avg YTD", value: totalAvgYtdYield)
                }
                .padding([.leading, .trailing, .bottom], 16)
                
                HStack {
                    Text("My Holdings:")
                        .font(.system(size: 24, weight: .bold))
                    Spacer()
                }
                .padding([.leading, .trailing], 16)
                
                VStack(alignment: .leading) {
                    ForEach($cards.indices, id: \.self) { index in
                        CardView(
                            tickerTitle: $cards[index].tickerTitle,
                            investmentAmt: $cards[index].investmentAmt,
                            avgYield: $cards[index].avgYield,
                            avgYtdYield: $cards[index].avgYtdYield,
                            onDelete: {
                                cards.remove(at: index)
                            }
                        )
                        .onTapGesture {
                            currentEditingIndex = index
                            showEditCardView = true
                        }
                    }
                }
                .padding(16)
            }
            .sheet(isPresented: $showAddCardView) {
                AddCardView(cards: $cards)
            }
            .sheet(isPresented: $showEditCardView) {
                if let index = currentEditingIndex {
                    EditCardView(
                        tickerTitle: $cards[index].tickerTitle,
                        investmentAmt: $cards[index].investmentAmt,
                        avgYield: $cards[index].avgYield,
                        avgYtdYield: $cards[index].avgYtdYield,
                        onDelete: {
                            cards.remove(at: index)
                            showEditCardView = false
                        }
                    )
                }
            }
            .onAppear {
                cards = FileManagerHelper.shared.loadCards()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
