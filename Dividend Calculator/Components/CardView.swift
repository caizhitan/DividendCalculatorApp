import SwiftUI

struct CardView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(red: 0.11, green: 0.12, blue: 0.13)
                    .cornerRadius(6)
                
                VStack(alignment: .leading) {
                    Text("YYY")
                        .font(Font.custom("SF Pro", size: 24).weight(.bold))
                        .foregroundColor(.white)
                        .padding(.top, 16)
                        .padding(.leading, 16)
                    
                    Spacer()
                    
                    Text("$1,000")
                        .font(Font.custom("SF Pro", size: 24).weight(.bold))
                        .foregroundColor(.white)
                        .padding(.leading, 16)
                        .padding(.bottom, 16)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .trailing) {
                    Text("Avg Yield:")
                        .font(Font.custom("SF Pro", size: 14))
                        .foregroundColor(.white)
                    
                    Text("3.65%")
                        .font(Font.custom("SF Pro", size: 14))
                        .foregroundColor(.white)
                    
                    Text("Avg YTD Yield:")
                        .font(Font.custom("SF Pro", size: 14))
                        .foregroundColor(.white)
                    
                    Text("7.85%")
                        .font(Font.custom("SF Pro", size: 14))
                        .foregroundColor(.white)
                }
                .padding(.top, 16)
                .padding(.trailing, 16)
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding()
            .frame(width: geometry.size.width * 0.98, height: 180, alignment: .center) // Adjust height as needed
            .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
