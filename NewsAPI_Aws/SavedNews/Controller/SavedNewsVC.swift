

import UIKit


class SavedNewsVC: UIViewController {
    
    let savedNewsView = SavedNewsView()
    
    override func loadView() {
        super.loadView()
        self.view = savedNewsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        setupTableView()
        savedNewsView.backBtn.addTarget(self, action: #selector(backBtnTapped), for: .touchUpInside)
    }
    
    
}
