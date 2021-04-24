//
//  ListPresenter.swift
//  MaxEducationTask
//
//  Created by Максим Сурков on 23.04.2021.
//

import Foundation
import UIKit

protocol ListViewProtocol: class{
    func succes()
    func failure(error: Error)
}

protocol ListViewPresenterProtocol: class {
    init(view: ListViewProtocol, networkService: NetworkServiceProtocol)
    func fetchNewsData()
    var storageNews: ListNews? {get}
}

class ListPresenter: ListViewPresenterProtocol {

    weak var view: ListViewProtocol?
    var apiClient : NetworkServiceProtocol!
    var storageNews: ListNews?
    
    let defaultUrl = URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/768px-No_image_available.svg.png")
    required init(view: ListViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.apiClient = networkService
    }
    
    func fetchNewsData() {
        self.apiClient.getListNewsData { [weak self](result) in
            switch result{
            case .success(let listNews):
                self?.storageNews = listNews
                self?.view?.succes()
            case .failure(let error):
                print("Get news error \(error)")
            }
        }
    }
}
