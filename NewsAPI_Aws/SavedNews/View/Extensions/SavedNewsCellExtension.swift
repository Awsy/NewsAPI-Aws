

import UIKit
import SnapKit

extension SavedNewsCell {

    func setupConstraints() {
        setupNewsAuthor()
        setupNewsImage()
        setupNewsTitle()
        setupNewsText()
    }
    
    func setupNewsAuthor() {
        newsAuthor.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(32)
            make.left.equalTo(newsImage.snp.left)
        }
    }
    
    func setupNewsImage() {
        newsImage.snp.makeConstraints { make in
            make.top.equalTo(newsAuthor.snp.bottom).offset(12)
            make.left.equalTo(self.snp.left).offset(40)
            make.right.equalTo(self.snp.right).offset(-40)
            make.height.equalTo(134)
        }
    }
    
    func setupNewsTitle() {
        newsTitle.snp.makeConstraints { make in
            make.left.equalTo(newsImage.snp.left)
            make.right.equalTo(newsImage.snp.right)
            make.top.equalTo(newsImage.snp.bottom).offset(8)
        }
    }
    
    func setupNewsText() {
        newsText.snp.makeConstraints { make in
            make.top.equalTo(newsTitle.snp.bottom).offset(4)
            make.left.equalTo(self.snp.left).offset(40)
            make.right.equalTo(self.snp.right).offset(-40)
            make.bottom.equalTo(self.snp.bottom).offset(-8)
        }
    }
}


