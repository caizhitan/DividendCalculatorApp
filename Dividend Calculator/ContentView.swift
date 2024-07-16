import SwiftUI

struct ContentView: View {
    @State private var cardWidth: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("Total Investments:")
                        .font(.system(size: 28, weight: .bold))
                    Text("$10,000")
                        .font(.system(size: 20, weight: .medium))
                    Text("Yearly Income:")
                        .font(.system(size: 24, weight: .semibold))
                    Text("$1,000")
                        .font(.system(size: 20, weight: .medium))
                }
                .padding()
                .frame(width: geometry.size.width, alignment: .leading)
                
                HStack {
                    Spacer()
                    Text("Placeholder")
                    Text("Placeholder")
                    Spacer()
                }
                .padding()
                .frame(width: geometry.size.width, alignment: .center)
                
                HStack {
                    Text("My Holdings:")
                        .font(.system(size: 24, weight: .bold))
                    Spacer()
                    CustomButton()
                }
                .padding()
                .frame(width: geometry.size.width, alignment: .center)
                
                VStack(alignment: .leading) {
                    CardView()

                    
                    
                }
                .padding()
 
                
               
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .topLeading)
        }
    }
}

#Preview {
    ContentView()
}
