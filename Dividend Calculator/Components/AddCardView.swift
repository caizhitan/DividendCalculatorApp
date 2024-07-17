import SwiftUI

struct AddCardView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var cards: [Card]
    
    @State private var tickerTitle: String = ""
    @State private var investmentAmt: String = ""
    @State private var avgYield: String = ""
    @State private var avgYtdYield: String = ""
    
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    @FocusState private var tickerTitleFieldIsFocused: Bool

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Add Ticker Title")) {
                    TextField("Ticker Title", text: $tickerTitle)
                        .autocapitalization(.allCharacters)
                        .textContentType(.name)
                        .focused($tickerTitleFieldIsFocused)
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
                guard let investmentAmtValue = Double(investmentAmt),
                      let avgYieldValue = Double(avgYield),
                      let avgYtdYieldValue = Double(avgYtdYield) else {
                    alertMessage = "Please enter valid numbers for Investment Amount, Average Yield, and Average YTD Yield."
                    showAlert = true
                    return
                }

                let newCard = Card(
                    id: UUID(),
                    tickerTitle: tickerTitle,
                    investmentAmt: investmentAmtValue,
                    avgYield: avgYieldValue,
                    avgYtdYield: avgYtdYieldValue
                )
                cards.insert(newCard, at: 0) // Insert new card at the top
                presentationMode.wrappedValue.dismiss()
            })
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Invalid Input"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.tickerTitleFieldIsFocused = true
                }
            }
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
