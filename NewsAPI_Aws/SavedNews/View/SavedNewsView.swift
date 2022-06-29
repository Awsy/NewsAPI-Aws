

import UIKit

class SavedNewsView: UIView {
    
    let upperView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.11, green: 0.118, blue: 0.158, alpha: 1)
        return view
    }()
    
    let savedTitle: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.font = .systemFont(ofSize: 24)
        lbl.text = "Saved Articles"
        return lbl
    }()
    
    let backBtn: UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(UIImage(systemName: "arrowshape.turn.up.backward.fill"), for: .normal)
        btn.tintColor = .white
        return btn
    }()
    
    let savedTableView: UITableView = {
        let tableView = UITableView()
        
        tableView.backgroundColor = .clear
        tableView.separatorColor = .white
        tableView.layer.cornerRadius = 18
        tableView.register(SavedNewsCell.self, forCellReuseIdentifier: SavedNewsCell.identifier)
        tableView.rowHeight = 360
        
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
         setupConstraints()
    }
    
    private func addSubviews() {
        
        [upperView, savedTableView].forEach {
            self.addSubview($0)
        }
        
        [savedTitle, backBtn].forEach {
            upperView.addSubview($0)
        }
        
    }
    
}
