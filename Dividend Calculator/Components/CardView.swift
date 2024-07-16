import SwiftUI

struct CardView: View {
    @Binding var tickerTitle: String
    @Binding var investmentAmt: Double
    @Binding var avgYield: Double
    @Binding var avgYtdYield: Double
    var onDelete: () -> Void
    
    @State private var showEditCardView = false

    var body: some View {
        ZStack {
            Color(red: 0.11, green: 0.12, blue: 0.13)
                .cornerRadius(8)
            
            VStack(alignment: .leading) {
                Text(tickerTitle)
                    .font(.system(size: 26, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.top, 16)
                    .padding(.leading, 16)
                
                Spacer()
                
                Text("$\(investmentAmt.formattedWithSeparator())")
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(.leading, 16)
                    .padding(.bottom, 16)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(alignment: .trailing, spacing: 4) {
                Text("Avg Yield:")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.white)
                
                Text(String(format: "%.2f%%", avgYield))
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.white)
                
                Text("Avg YTD Yield:")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.white)
                
                Text(String(format: "%.2f%%", avgYtdYield))
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.white)
                
                Spacer()
            }
            .padding(.top, 16)
            .padding(.trailing, 16)
            .frame(maxWidth: .infinity, alignment: .topTrailing)
        }
        .frame(height: 150)
        .onTapGesture {
            showEditCardView = true
        }
        .sheet(isPresented: $showEditCardView) {
            EditCardView(
                tickerTitle: $tickerTitle,
                investmentAmt: $investmentAmt,
                avgYield: $avgYield,
                avgYtdYield: $avgYtdYield,
                onDelete: {
                    onDelete()
                    showEditCardView = false
                }
            )
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(
            tickerTitle: .constant("YYY"),
            investmentAmt: .constant(1000.00),
            avgYield: .constant(3.65),
            avgYtdYield: .constant(7.85),
            onDelete: {}
        )
    }
}
