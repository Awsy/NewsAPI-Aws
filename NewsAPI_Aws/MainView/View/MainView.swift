

import UIKit

class MainView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
         setupConstraints()
    }
    
    private func addSubviews() {
        
        [].forEach {
            self.addSubview($0)
        }
        
    }
}
