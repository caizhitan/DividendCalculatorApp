import SwiftUI

struct MiniCardView: View {
    var title: String
    var value: Double
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        let themeProvider = ThemeProvider(colorScheme: colorScheme)
        
        return ZStack {
            themeProvider.backgroundColor
                .cornerRadius(12)
            
            VStack(alignment: .center, spacing: 8) {
                Text(title)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(themeProvider.textColor)
                
                Text(String(format: "%.2f%%", value))
                    .font(Font.custom("SF Pro", size: 18).weight(.medium))
                    .foregroundColor(themeProvider.textColor)
            }
            .padding(8)
        }
        .frame(height: 80)
    }
}

struct MiniCardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MiniCardView(title: "Avg Yield", value: 3.65)
                .environment(\.colorScheme, .light)
            
            MiniCardView(title: "Avg Yield", value: 3.65)
                .environment(\.colorScheme, .dark)
        }
    }
}
