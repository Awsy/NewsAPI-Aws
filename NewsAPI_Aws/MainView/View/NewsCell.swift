

import UIKit
import SnapKit

protocol NewsCellProtocol: AnyObject {
    func save()
}

class NewsCell: UITableViewCell {

    static let identifier = "NewsCell"
    
    weak var delegate: NewsCellProtocol?
    
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
    
    let saveBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .clear
        btn.tintColor = .white
        btn.setBackgroundImage(UIImage(systemName: "square.and.arrow.down"), for: .normal)
        return btn
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = .clear
        contentView.isUserInteractionEnabled = true
        addSubviews()
        saveBtn.addTarget(self, action: #selector(saveBtnTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    struct ViewModel {
        let title: String
        let author: String
        let description: String
        let url: URL
        let urlToImage: URL
    }
    
    private func addSubviews() {
        
        [newsAuthor, newsImage, newsTitle, newsText, saveBtn].forEach {
            self.addSubview($0)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
    }
    
    @objc func didTapSaveBtn() {
        delegate?.save()
    }
    
    
    
     @objc func saveBtnTapped() {
         print("save btn tapped")

         
         let newItem = SavedNewsModel(author: newsAuthor.text ?? "", title: newsTitle.text ?? "", description: newsText.text ?? "")


         NewsSaveModel.savedNews.append(newItem)
         
     }
     

}
