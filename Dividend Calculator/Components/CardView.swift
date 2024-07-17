import SwiftUI

struct CardView: View {
    @Binding var tickerTitle: String
    @Binding var investmentAmt: Double
    @Binding var avgYield: Double
    @Binding var avgYtdYield: Double
    var onDelete: () -> Void
    
    @State private var showEditCardView = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        let themeProvider = ThemeProvider(colorScheme: colorScheme)
        
        return ZStack {
            themeProvider.backgroundColor
                .cornerRadius(12)
            
            VStack(alignment: .leading) {
                Text(tickerTitle)
                    .font(.system(size: 26, weight: .bold))
                    .foregroundColor(themeProvider.textColor)
                    .padding(.top, 16)
                    .padding(.leading, 16)
                
                Spacer()
                
                Text("$\(investmentAmt.formattedWithSeparator())")
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundColor(themeProvider.textColor)
                    .padding(.leading, 16)
                    .padding(.bottom, 16)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(alignment: .trailing, spacing: 4) {
                Text("Avg Yield:")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(themeProvider.textColor)
                
                Text(String(format: "%.2f%%", avgYield))
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(themeProvider.textColor)
                
                Text("Avg YTD Yield:")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(themeProvider.textColor)
                
                Text(String(format: "%.2f%%", avgYtdYield))
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(themeProvider.textColor)
                
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
        Group {
            CardView(
                tickerTitle: .constant("YYY"),
                investmentAmt: .constant(1000.00),
                avgYield: .constant(3.65),
                avgYtdYield: .constant(7.85),
                onDelete: {}
            )
            .environment(\.colorScheme, .light)
            
            CardView(
                tickerTitle: .constant("YYY"),
                investmentAmt: .constant(1000.00),
                avgYield: .constant(3.65),
                avgYtdYield: .constant(7.85),
                onDelete: {}
            )
            .environment(\.colorScheme, .dark)
        }
    }
}
