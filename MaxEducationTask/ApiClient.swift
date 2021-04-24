//
//  ApiClient.swift
//  MaxEducationTask
//
//  Created by Максим Сурков on 23.04.2021.
//

import Foundation

protocol NetworkServiceProtocol{
    func getListNewsData(completion: @escaping (Result<ListNews, Error>) -> Void)
}


class APIClient {
    
    private var dataTask: URLSessionDataTask?
    let decoder = JSONDecoder()
    
    private func makeListNewsUrl() -> URL?{
        var result = URLComponents()
        result.scheme = "https"
        result.host = "api.nytimes.com"
        result.path = "/svc/mostpopular/v2/emailed/7.json"
        result.query = "api-key=GDKG2dY2WUfdgTc80eoxAdlAF3GPxC1G"
        return result.url
    }
}

extension APIClient: NetworkServiceProtocol {
    func getListNewsData(completion: @escaping (Result<ListNews, Error>) -> Void) {
        let listNewsURL = makeListNewsUrl()
        //print(listNewsURL)
        dataTask = URLSession.shared.dataTask(with: listNewsURL!) { (data, response, error) in
            
            if let error = error {
               print("DataTask error: \(error.localizedDescription)")
               return
            }
            guard let data = data else {
               print("Empty Response")
               return
            }
            do {
                let jsonData = try self.decoder.decode(ListNews.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
            }
            catch let error {
                completion(.failure(error))
            }
        }
        dataTask?.resume()
    }
}

