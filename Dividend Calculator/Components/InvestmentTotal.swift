import SwiftUI

struct InvestmentTotal: View {
    var totalInvestment: Double
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Total Investments:")
                .font(.system(size: 24, weight: .bold))
            Text("$\(totalInvestment.formattedWithoutCents())")
                .font(.system(size: 24, weight: .medium))
        }
    }
}

struct InvestmentTotal_Previews: PreviewProvider {
    static var previews: some View {
        InvestmentTotal(totalInvestment: 0.00)
    }
}
