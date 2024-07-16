import SwiftUI

struct EditCardView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var tickerTitle: String
    @Binding var investmentAmt: Double
    @Binding var avgYield: Double
    @Binding var avgYtdYield: Double
    var onDelete: () -> Void
    
    private var decimalFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 0
        formatter.usesGroupingSeparator = false
        return formatter
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Edit Ticker Title")) {
                    TextField("Ticker Title", text: $tickerTitle)
                }
                
                Section(header: Text("Edit Investment Amount")) {
                    TextField("Investment Amount", value: $investmentAmt, formatter: decimalFormatter)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Edit Average Yield")) {
                    TextField("Average Yield", value: $avgYield, formatter: decimalFormatter)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Edit Average YTD Yield")) {
                    TextField("Average YTD Yield", value: $avgYtdYield, formatter: decimalFormatter)
                        .keyboardType(.decimalPad)
                }
                
                Section {
                    Button(action: {
                        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .medium)
                        impactFeedbackgenerator.impactOccurred()

                        onDelete()
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Delete")
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity, alignment: .center) 
                    }
                }
            }
            .navigationBarTitle("Edit Stock Ticker", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            }, trailing: Button("Save") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct EditCardView_Previews: PreviewProvider {
    static var previews: some View {
        EditCardView(tickerTitle: .constant("YYY"), investmentAmt: .constant(1000.00), avgYield: .constant(3.65), avgYtdYield: .constant(7.85), onDelete: {})
    }
}
