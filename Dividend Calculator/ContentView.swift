import SwiftUI
import UIKit

struct ContentView: View {
    @State private var cardWidth: CGFloat = 0
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
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("Overall")
                        .font(.system(size: 30, weight: .bold))
                    Divider()
                        .background(Color.white)
                    
                    InvestmentTotal(totalInvestment: totalInvestment)
                    
                    YearlyIncome(yearlyIncome: totalIncome)
                }
                .padding()
                .frame(width: geometry.size.width, alignment: .leading)
                
                HStack {
                    MiniCardView(title: "Total Avg Yield", value: 3.65)
                    Spacer()
                    MiniCardView(title: "Total Avg YTD", value: 10.65)
                }
                .padding([.leading, .trailing, .bottom])
                .frame(width: geometry.size.width, alignment: .center)
                
                HStack {
                    Text("My Holdings:")
                        .font(.system(size: 24, weight: .bold))
                    Spacer()
                    AddButton(action: {
                        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .medium)
                        impactFeedbackgenerator.impactOccurred()
                        showAddCardView = true
                    })
                }
                .padding([.leading, .trailing])
                .frame(width: geometry.size.width, alignment: .center)
                
                ScrollView {
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
                    .padding()
                    .frame(width: geometry.size.width, alignment: .center)
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .topLeading)
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
