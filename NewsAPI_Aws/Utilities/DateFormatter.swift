

import UIKit

extension UIViewController {
    public func formatTimeString(date: String) -> String {
        
         let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
         guard let newDate = dateFormatter.date(from: date)  else { return "No date" }
         dateFormatter.setLocalizedDateFormatFromTemplate("hh:mm a")
        
         return dateFormatter.string(from: newDate)
     }
}
