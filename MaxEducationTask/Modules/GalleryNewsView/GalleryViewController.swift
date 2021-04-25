//
//  GalleryViewController.swift
//  MaxEducationTask
//
//  Created by Максим Сурков on 25.04.2021.
//

import Foundation
import UIKit
import ImageViewer_swift
import Kingfisher

class GalleryViewController: UIViewController {
    var presenter: GalleryViewPresenterProtocol!
    
        
    private lazy var layout = GalleryFlowLayout()
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Gallery"
        configureCollectionView()
        presenter.fetchGalleryData()
    }
    private func configureCollectionView() {
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(GalleryCell.self, forCellWithReuseIdentifier: "GalleryCell")
        collectionView.dataSource = self
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateLayout(view.frame.size)
    }
    
    private func updateLayout(_ size:CGSize) {
        if size.width > size.height {
            layout.columns = 4
        } else {
            layout.columns = 3
        }
    }
    
    override func viewWillTransition (
        to size: CGSize,
        with coordinator: UIViewControllerTransitionCoordinator) {
        updateLayout(size)
    }
}

extension GalleryViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.storagePhotoAdress?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCell", for: indexPath) as! GalleryCell
        DispatchQueue.main.async {
            cell.imageView.kf.setImage(with: self.presenter.storagePhotoAdress?[indexPath.row])
        }
        cell.imageView.setupImageViewer(urls: presenter.storagePhotoAdress ?? [], initialIndex: indexPath.item, placeholder: UIImage(named: "noImage"))
        return cell
    }
}
extension GalleryViewController: GalleryViewProtocol {
    func succes() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func failure(error: Error) {
        print(error)
    }
    
    
}
