import Foundation

class FileManagerHelper {
    static let shared = FileManagerHelper()
    private init() {}
    
    private let fileName = "cards.json"
    
    private var fileURL: URL? {
        do {
            return try FileManager.default
                .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                .appendingPathComponent(fileName)
        } catch {
            print("Error getting file URL: \(error.localizedDescription)")
            return nil
        }
    }
    
    func saveCards(_ cards: [Card]) {
        guard let fileURL = fileURL else { return }
        
        do {
            let data = try JSONEncoder().encode(cards)
            try data.write(to: fileURL)
        } catch {
            print("Error saving cards: \(error.localizedDescription)")
        }
    }
    
    func loadCards() -> [Card] {
        guard let fileURL = fileURL else { return [] }
        
        do {
            let data = try Data(contentsOf: fileURL)
            let cards = try JSONDecoder().decode([Card].self, from: data)
            return cards
        } catch {
            print("Error loading cards: \(error.localizedDescription)")
            return []
        }
    }
}
