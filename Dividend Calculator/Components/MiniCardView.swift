import SwiftUI

struct MiniCardView: View {
    var title: String
    var value: Double
    
    var body: some View {
        ZStack {
            Color(red: 0.11, green: 0.12, blue: 0.13)
                .cornerRadius(8)
            
            VStack(alignment: .center, spacing: 8) {
                Text(title)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
                
                Text(String(format: "%.2f%%", value))
                    .font(Font.custom("SF Pro", size: 18).weight(.medium))
                    .foregroundColor(.white)
            }
            .padding(8)
        }
        .frame(height: 80)
    }
}

struct MiniCardView_Previews: PreviewProvider {
    static var previews: some View {
        MiniCardView(title: "Avg Yield", value: 3.65)
    }
}
