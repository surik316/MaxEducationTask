//
//  ApiClient.swift
//  MaxEducationTask
//
//  Created by Максим Сурков on 23.04.2021.
//

import Foundation
import UIKit
protocol NetworkServiceProtocol {
    func getListNewsData(completion: @escaping (Result<ListNews, Error>) -> Void)
    func getNewsImageUrlsMOK(completion: @escaping (Result<[MediaMetadatum], Error>) -> Void)
}


class APIClient {
    
    private var dataTask: URLSessionDataTask?
    let decoder = JSONDecoder()
    
    private func makeListNewsUrl() -> URL? {
        var result = URLComponents()
        result.scheme = "https"
        result.host = "api.nytimes.com"
        result.path = "/svc/mostpopular/v2/emailed/7.json"
        result.query = "api-key=\(UserDefaults.standard.object(forKey: "apiToken") ?? "")"
        return result.url
    }
}

extension APIClient: NetworkServiceProtocol {
    func getListNewsData(completion: @escaping (Result<ListNews, Error>) -> Void) {
        let listNewsURL = makeListNewsUrl()
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
    func getNewsImageUrlsMOK(completion: @escaping (Result<[MediaMetadatum], Error>) -> Void) {
        let list = [
            MediaMetadatum(url: "https://cdn.searchenginejournal.com/wp-content/uploads/2018/04/businesses-need-seo-1520x800.png"),
            MediaMetadatum(url:
                            "https://www.proofhub.com/wp-content/uploads/2020/05/Bussiness-management-software.jpg"),
            MediaMetadatum(url: "https://www.esa.int/var/esa/storage/images/about_us/business_with_esa/business_opportunities/19716978-3-eng-GB/Business_Opportunities_pillars.jpg"),
            MediaMetadatum(url: "https://www.thebalancesmb.com/thmb/G5Kq-EQR2gVt2hQh6_mrLGMUCRo=/1500x1000/filters:fill(auto,1)/improve-your-small-business-2951413-556a7d287050409bbd876af010f74be6.png")
        ]
        completion(.success(list))
    }
}

