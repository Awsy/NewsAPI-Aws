

import UIKit

class MainView: UIView {
    
    let upperView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.11, green: 0.118, blue: 0.158, alpha: 1)
        return view
    }()
    
    let newsTitle: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.font = .systemFont(ofSize: 24)
        lbl.text = "News"
        return lbl
    }()
    
    let savedNewsBtn: UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(UIImage(systemName: "star.fill"), for: .normal)
        btn.tintColor = .white
        return btn
    }()
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Search"
        searchBar.isTranslucent = true
        searchBar.backgroundColor = .systemGray2
        searchBar.alpha = 0.6
        searchBar.layer.cornerRadius = 10
        searchBar.tintColor = .white
        searchBar.clipsToBounds = true
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
            textField.textColor = UIColor.white
        }
        if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
            if let leftView = textfield.leftView as? UIImageView {
                leftView.image = leftView.image?.withRenderingMode(.alwaysTemplate)
                leftView.tintColor = UIColor.white
            }
        }
        return searchBar
    }()
    
    let newsTableView: UITableView = {
        let tableView = UITableView()
        
        tableView.backgroundColor = .clear
        tableView.separatorColor = .white
        tableView.layer.cornerRadius = 18
        tableView.register(NewsCell.self, forCellReuseIdentifier: NewsCell.identifier)
        tableView.rowHeight = 370
        
        return tableView
    }()
    
    
    
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
        
        [upperView, newsTableView].forEach {
            self.addSubview($0)
        }
        
        [newsTitle,searchBar, savedNewsBtn].forEach {
            upperView.addSubview($0)
        }
        
    }
    
}
