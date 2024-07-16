import SwiftUI

struct YearlyIncome: View {
    var yearlyIncome: Double
    
    var body: some View {
        VStack (alignment: .leading){
            Text("Yearly Income:")
                .font(.system(size: 22, weight: .bold))
            Text("$\(yearlyIncome.formattedWithoutCents())")
                .font(.system(size: 20, weight: .medium))

        }
    }
}

struct YearlyIncome_Previews: PreviewProvider {
    static var previews: some View {
        YearlyIncome(yearlyIncome: 1000.00)
    }
}
