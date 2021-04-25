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
    init(view: GalleryViewProtocol, networkService: NetworkServiceProtocol, model: MediaMetadatum)
    var storagePhotoAdress: [URL]? {get}
    func fetchGalleryData()
}

class GalleryPresenter: GalleryViewPresenterProtocol {
    
    
    weak var view: GalleryViewProtocol?
    var apiClient : NetworkServiceProtocol!
    var storagePhotoAdress: [URL]?
    var model: MediaMetadatum
   
    required init(view: GalleryViewProtocol, networkService: NetworkServiceProtocol, model: MediaMetadatum) {
        self.view = view
        self.apiClient = networkService
        self.model = model
    }
    func fetchGalleryData() {
        self.apiClient.getNewsImageUrlsMOK { (result) in
            switch result{
            case .success(let listData):
                
                self.storagePhotoAdress = listData.compactMap{ URL(string: $0.url)!}
                self.storagePhotoAdress?.append(URL(string: self.model.url)!)
                self.view?.succes()
            case .failure(_):
                print("Error")
            }
        }
    }
    
}
