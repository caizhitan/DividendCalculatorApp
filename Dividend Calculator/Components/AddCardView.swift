// Components/AddCardView.swift

import SwiftUI

struct AddCardView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var cards: [Card]
    
    @State private var tickerTitle: String = ""
    @State private var investmentAmt: String = ""
    @State private var avgYield: String = ""
    @State private var avgYtdYield: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Add Ticker Title")) {
                    TextField("Ticker Title", text: $tickerTitle)
                }
                
                Section(header: Text("Add Investment Amount")) {
                    TextField("Investment Amount", text: $investmentAmt)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Add Average Yield")) {
                    TextField("Average Yield", text: $avgYield)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Add Average YTD Yield")) {
                    TextField("Average YTD Yield", text: $avgYtdYield)
                        .keyboardType(.decimalPad)
                }
            }
            .navigationBarTitle("Add Stock Ticker", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            }, trailing: Button("Save") {
                let newCard = Card(
                    id: UUID(),
                    tickerTitle: tickerTitle,
                    investmentAmt: Double(investmentAmt) ?? 0.00,
                    avgYield: Double(avgYield) ?? 0.00,
                    avgYtdYield: Double(avgYtdYield) ?? 0.00
                )
                cards.insert(newCard, at: 0) // Insert new card at the top
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct AddCardView_Previews: PreviewProvider {
    static var previews: some View {
        AddCardView(cards: .constant([
            Card(id: UUID(), tickerTitle: "YYY", investmentAmt: 1000.00, avgYield: 3.65, avgYtdYield: 7.85)
        ]))
    }
}
