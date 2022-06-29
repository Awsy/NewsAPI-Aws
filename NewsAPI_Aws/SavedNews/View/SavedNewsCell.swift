

import UIKit

class SavedNewsCell: UITableViewCell {

    static let identifier = "SavedNewsCell"
    
    var newsAuthor: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray6
        label.font = UIFont(name: "Poppins-Medium", size: 14)
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    var newsImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        
        return image
    }()
    
    var newsTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Poppins-Medium", size: 12)
        label.textColor = .white
        label.numberOfLines = 0
        
        return label
    }()
    
    var newsText: UITextView = {
        
       let textView = UITextView()
        textView.font = UIFont(name: "Poppins-Medium", size: 16)
        textView.textColor = .systemGray5
        textView.backgroundColor = .clear
        textView.textContainer.maximumNumberOfLines = 0
        textView.isEditable = false
        textView.isUserInteractionEnabled = true
        textView.isScrollEnabled = true
    
        return textView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        addSubViews()
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubViews() {
        
        [newsAuthor, newsImage, newsTitle, newsText].forEach {
            self.addSubview($0)
        }

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
    }

}
