

import UIKit
import SnapKit
import SDWebImage
import SafariServices

extension MainView {
    
    func setupConstraints() {
        setupUpperView()
        setupNewsTitle()
        setupSavedBtn()
        setupSearchBar()
        setupTableView()
    }
    
    func setupUpperView() {
        upperView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
            make.height.equalTo(170)
        }
    }
    
    func setupNewsTitle() {
        newsTitle.snp.makeConstraints { make in
            make.centerX.equalTo(upperView.snp.centerX)
            make.bottom.equalTo(searchBar.snp.top).offset(-6)
        }
    }
    
    func setupSavedBtn() {
        savedNewsBtn.snp.makeConstraints { make in
            make.bottom.equalTo(searchBar.snp.top).offset(-6)
            make.right.equalTo(upperView.snp.right).offset(-16)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
    }
    
    func setupSearchBar() {
        searchBar.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.bottom.equalTo(upperView.snp.bottom)
            make.right.equalTo(upperView.snp.right)
            make.left.equalTo(upperView.snp.left)
            make.height.equalTo(50)
        }
    }
    
    func setupTableView() {
        newsTableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
            make.bottom.equalTo(self.snp.bottom).offset(-30)
        }
    }
    
}


extension MainVC: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate, UISearchBarDelegate {
    
    func setupTableView() {
        mainView.newsTableView.delegate = self
        mainView.newsTableView.dataSource = self
        mainView.searchBar.delegate = self
        mainView.savedNewsBtn.addTarget(self, action: #selector(savedVcTapped), for: .touchUpInside)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isSearchBarFiltered {
            return searchBarFiltered.count
            
        } else {
            return news?.articles.count ?? 0
        }

        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.identifier, for: indexPath) as! NewsCell
        let fetchedNews = news?.articles[indexPath.row]
        
        
        if searchBarFiltered.count != 0 {
            cell.newsTitle.text = searchBarFiltered[indexPath.row].title
            cell.newsText.text = searchBarFiltered[indexPath.row].description
            cell.newsAuthor.text = searchBarFiltered[indexPath.row].author
            cell.newsImage.sd_setImage(with: self.searchBarFiltered[indexPath.row].urlToImage)
            
        } else {
            
            cell.newsText.text = fetchedNews?.description
            cell.newsTitle.text = fetchedNews?.title
            cell.newsAuthor.text = fetchedNews?.author
            cell.newsImage.sd_setImage(with: fetchedNews?.urlToImage)
            
        }
        
        
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let fetchedNews = news?.articles[indexPath.row]
        
        if searchBarFiltered.count != 0 {
            let vc = SFSafariViewController(url: (searchBarFiltered[indexPath.row].url))
            present(vc, animated: true)
            
        } else {
            let vc = SFSafariViewController(url: (fetchedNews?.url)!)
            present(vc, animated: true)
        }
        
        
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > (mainView.newsTableView.contentSize.height - 40 - scrollView.frame.size.height) {
            print("pagination begins")
            
            // THIS MUST BE FIXED!
            dataRefresher()
            DispatchQueue.main.async { [self] in
                mainView.newsTableView.reloadData()
            }
        }
        
    }
    
    
    func dataRefresher() {
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        mainView.newsTableView.addSubview(refreshControl)
    }
    
    
    @objc func refresh(_ sender: UIRefreshControl) {
    
        dataFetcherService.fetchNews { news in
            self.news = news
            self.mainView.newsTableView.reloadData()
        }
        
        sender.endRefreshing()
    }
    
    @objc func savedVcTapped() {
        let vc = SavedNewsVC()
        vc.modalPresentationStyle = .overFullScreen
        animatedOpening()
        present(vc, animated: false)
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        updateViewModels()
    }
    
    func viewModel(for news: Article) -> NewsCell.ViewModel {
        
        return NewsCell.ViewModel(title: news.title ?? "", author: news.author ?? "", description: news.description ?? "", url: news.url!, urlToImage: news.urlToImage ?? URL(fileURLWithPath: "No Image"))
    }
    
    func updateViewModels() {
        
        guard var news = news?.articles else {
            searchBarFiltered.removeAll()
            return
        }
        
        if let searchText = mainView.searchBar.text, !searchText.isEmpty {
            news = news.filter { (newsFeed) -> Bool in
                newsFeed.title!.localizedCaseInsensitiveContains(searchText)
            }
        }
        
        searchBarFiltered = news.map { viewModel(for: $0) }
        isSearchBarFiltered = true
        mainView.newsTableView.reloadData()
    }
    
    
}

//formatTimeString(date: fetchedNews?.publishedAt ?? "")
