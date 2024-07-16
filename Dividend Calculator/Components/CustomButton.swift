import SwiftUI

struct CustomButton: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 12, height: 2)
                .foregroundColor(Color(red: 1, green: 1, blue: 1))
                .cornerRadius(4)
                .offset(y: 0)
            Rectangle()
                .frame(width: 12, height: 2)
                .foregroundColor(Color(red: 1, green: 1, blue: 1))
                .cornerRadius(4)
                .rotationEffect(.degrees(90))
                .offset(x: 0)
        }
        .frame(width: 24, height: 24)
        .background(Color(red: 0, green: 0.48, blue: 1))
        .cornerRadius(12)
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton()
    }
}
