import SwiftUI

struct AddButton: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Rectangle()
                    .frame(width: 12, height: 2)
                    .foregroundColor(Color.white)
                    .cornerRadius(4)
                    .offset(y: 0)
                Rectangle()
                    .frame(width: 12, height: 2)
                    .foregroundColor(Color.white)
                    .cornerRadius(4)
                    .rotationEffect(.degrees(90))
                    .offset(x: 0)
            }
            .frame(width: 24, height: 24)
            .background(Color.blue)
            .cornerRadius(12)
        }
    }
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        AddButton(action: {})
    }
}
