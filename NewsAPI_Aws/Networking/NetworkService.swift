

import Foundation


// Network Service
protocol NetworkingProtocol {
    
    func request(urlString: String, completion: @escaping (Data?, Error?) -> Void)
}

class NetworkService: NetworkingProtocol {
    
    // building data requests by url
    func request(urlString: String, completion: @escaping (Data?, Error?) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }
    
    private func createDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        
        return URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            
            DispatchQueue.main.async {
                
                completion(data, error)
            }
        })
    }
}
