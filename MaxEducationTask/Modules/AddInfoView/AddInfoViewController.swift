//
//  AddInfoViewController.swift
//  MaxEducationTask
//
//  Created by Максим Сурков on 24.04.2021.
//

import Foundation
import UIKit
import Kingfisher

class AddInfoViewController: UIViewController {
    
    var presenter: AddInfoPresenterProtocol!
    private let scrollView = UIScrollView()
    private let contentView = ContentView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        presenter.setView()
        configurescrollView()
    }
    private func configurescrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, constant: 300),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
    
}
extension AddInfoViewController: AddInfoViewProtocol {
    func succes(model: News) {
        contentView.titleLabel.text = model.title
        if model.media.count  > 0 {
            contentView.imageView.kf.setImage(with: URL(string: model.media[0].mediaMetadata[2].url), placeholder: UIImage(named: "noImage"))
            contentView.copyrightLabel.text = model.media[0].copyright
        } else {
            contentView.imageView.image = UIImage(named: "bnImage")
            contentView.copyrightLabel.text = "Copyright © 2021 The New York Times Company.  All Rights Reserved"
        }
        contentView.sourceLabel.text = model.source
        contentView.dateLabel.text = model.publishedDate
        contentView.descriptionLabel.text = model.abstract
        contentView.autorLabel.text = model.byline
        
    }
    
    func failure(error: Error) {
        print("Presenter \(error)")
    }
    
    
}
