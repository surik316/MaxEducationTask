//
//  GalleryPresenter.swift
//  MaxEducationTask
//
//  Created by Максим Сурков on 25.04.2021.
//

import Foundation
import UIKit

protocol GalleryViewProtocol: class{
    func succes()
    func failure(error: Error)
}

protocol GalleryViewPresenterProtocol: class {
    init(view: GalleryViewProtocol, networkService: NetworkServiceProtocol)
    var storagePhotoAdress: [URL]? {get}
    func fetchGalleryData()
}

class GalleryPresenter: GalleryViewPresenterProtocol {
    
    
    weak var view: GalleryViewProtocol?
    var apiClient : NetworkServiceProtocol!
    var storagePhotoAdress: [URL]?
    
   
    required init(view: GalleryViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.apiClient = networkService
    }
    func fetchGalleryData() {
        self.apiClient.getNewsImageUrlsMOK { (result) in
            switch result{
            case .success(let listData):
                
                self.storagePhotoAdress = listData.compactMap{ URL(string: $0.url)!}
                self.view?.succes()
            case .failure(_):
                print("Error")
            }
        }
    }
    
}
