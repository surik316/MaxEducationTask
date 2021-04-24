//
//  AddInfoPresenter.swift
//  MaxEducationTask
//
//  Created by Максим Сурков on 24.04.2021.
//

import Foundation

protocol AddInfoViewProtocol: class{
    func succes(model: News)
    func failure(error: Error)
}

protocol AddInfoPresenterProtocol: class {
    init(view: AddInfoViewProtocol, networkService: NetworkServiceProtocol, model: News)
    func setView()
}

class AddInfoPresenter: AddInfoPresenterProtocol {
    
    weak var view: AddInfoViewProtocol?
    var apiClient : NetworkServiceProtocol!
    var modelNews: News?
    
    required init(view: AddInfoViewProtocol, networkService: NetworkServiceProtocol, model: News) {
        self.view = view
        self.apiClient = networkService
        self.modelNews = model
    }
    public func setView(){
        self.view?.succes(model: modelNews ?? News()) //сделать дефолтную модель
    }

}

