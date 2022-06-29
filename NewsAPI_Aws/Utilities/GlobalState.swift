

import Foundation


struct NewsSaveModel {
    
    static var savedNews: [SavedNewsModel] {
        get {
            guard let news = UserDefaults.standard.array(forKey: "SavedNews") as? [Data] else {
                return []
            }
            return news.map { try! JSONDecoder().decode(SavedNewsModel.self, from: $0) }
        }
        set {
            let data = newValue.map { try? JSONEncoder().encode($0) }
            UserDefaults.standard.setValue(data, forKey: "SavedNews")
        }
    }
}
