import SwiftUI

struct ThemeProvider {
    var colorScheme: ColorScheme
    
    var backgroundColor: Color {
        colorScheme == .dark ? Color(red: 0.11, green: 0.12, blue: 0.13) : Color(red: 0.811, green: 0.835, blue: 0.847)
    }
    
    var textColor: Color {
        colorScheme == .dark ? Color.white : Color.black
    }
}
