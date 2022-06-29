

import UIKit
import SnapKit

extension SavedNewsView {
    
    func setupConstraints() {
        setupUpperView()
        setupSavedTitle()
        setupBackBtn()
        setupTableView()
    }
    
    func setupUpperView() {
        upperView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
            make.height.equalTo(120)
        }
    }
    
    func setupSavedTitle() {
        savedTitle.snp.makeConstraints { make in
            make.centerX.equalTo(upperView.snp.centerX)
            make.bottom.equalTo(upperView.snp.bottom).offset(-20)
        }
    }
    
    func setupBackBtn() {
        backBtn.snp.makeConstraints { make in
            make.bottom.equalTo(upperView.snp.bottom).offset(-20)
            make.left.equalTo(upperView.snp.left).offset(16)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
    }
    
    func setupTableView() {
        savedTableView.snp.makeConstraints { make in
            make.top.equalTo(upperView.snp.bottom)
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
            make.bottom.equalTo(self.snp.bottom).offset(-30)
        }
    }
    
}



extension SavedNewsVC: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        savedNewsView.savedTableView.delegate = self
        savedNewsView.savedTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NewsSaveModel.savedNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SavedNewsCell.identifier, for: indexPath) as! SavedNewsCell
        
        let savedNews = NewsSaveModel.savedNews[indexPath.row]
        
        cell.newsAuthor.text = savedNews.author
        cell.newsTitle.text = savedNews.title
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            NewsSaveModel.savedNews.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            tableView.endUpdates()
        }
    }
    
    
    @objc func backBtnTapped() {
        animatedDismiss()
        dismiss(animated: false)
    }
    
    
    
}
