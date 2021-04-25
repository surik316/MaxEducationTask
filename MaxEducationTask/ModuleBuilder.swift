//
//  ModuleBuilder.swift
//  MaxEducationTask
//
//  Created by Максим Сурков on 23.04.2021.
//

import Foundation
import UIKit

protocol Builder {
    static func createListModule() -> UIViewController
    static func createAddInfoModule(modelNews: News) -> UIViewController
    static func createGalleryModule(model: MediaMetadatum) -> UIViewController
}

class ListBuilder: Builder{
    static func createAddInfoModule(modelNews: News) -> UIViewController {
        let networkService = APIClient()
        let view = AddInfoViewController()
        let presenter = AddInfoPresenter(view: view , networkService: networkService, model: modelNews)
        view.presenter = presenter
        return view
    }
    
    static func createListModule() -> UIViewController {
        let networkService = APIClient()
        let view = ListViewController()
        let presenter = ListPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
    static func createGalleryModule(model: MediaMetadatum) -> UIViewController {
        let networkService = APIClient()
        let view = GalleryViewController()
        let presenter = GalleryPresenter(view: view, networkService: networkService, model: model)
        view.presenter = presenter
        return view
    }
}
