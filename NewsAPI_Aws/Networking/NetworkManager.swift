

import Foundation


// Data Fetcher Service
class DataFetcherService {
    
    var dataFetcher: DataFetcherProtocol
    
    init(dataFetcher: DataFetcherProtocol = NetworkDataFetcher()) {
        self.dataFetcher = dataFetcher
    }
    
    func fetchEvents(completion: @escaping (NewsList?) -> Void) {
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&apiKey=8d0da10868f14f719b2131ceaadf366c"
        dataFetcher.fetchGenericJSONData(urlString: urlString, response: completion)
    }
   
}
