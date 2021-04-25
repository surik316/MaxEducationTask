//
//  GalleryCell.swift
//  MaxEducationTask
//
//  Created by Максим Сурков on 25.04.2021.
//

import Foundation
import UIKit
class GalleryCell: UICollectionViewCell {
    
    var imageView = UIImageView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }
    
    private func configureCell() {
        
        addSubview(imageView)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leftAnchor.constraint(equalTo: leftAnchor),
            imageView.rightAnchor.constraint(equalTo: rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
