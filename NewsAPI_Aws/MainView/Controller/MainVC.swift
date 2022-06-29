

import UIKit

class MainVC: UIViewController {
    
    let mainView = MainView()
    var news: NewsList?
    var dataFetcherService = DataFetcherService()
    var searchBarFiltered = [NewsCell.ViewModel]()
    var isSearchBarFiltered = false
    let refreshControl = UIRefreshControl()
    
    
    override func loadView() {
        super.loadView()
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        dataRefresher()
        view.backgroundColor = .darkGray
        hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dataFetcherService.fetchNews { news in
            self.news = news
            self.mainView.newsTableView.reloadData()
        }
        
    }
    

    
}
