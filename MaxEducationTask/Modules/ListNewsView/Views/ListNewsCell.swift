//
//  ListNewsCell.swift
//  MaxEducationTask
//
//  Created by Максим Сурков on 23.04.2021.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell {
    
     let newsImageView = UIImageView ()
     let titleLabel = UILabel()
     let tagsLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(newsImageView)
        self.addSubview(titleLabel)
        self.addSubview(tagsLabel)
        
        configureNewsImageView()
        configureTitleLabel()
        configureTagsLabel()
       
    }
    
    private func configureNewsImageView() {
        
        newsImageView.layer.cornerRadius = 19
        newsImageView.clipsToBounds = true
        
        newsImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newsImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            newsImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            newsImageView.heightAnchor.constraint(equalToConstant: 110),
            newsImageView.widthAnchor.constraint(equalTo: newsImageView.heightAnchor),
        ])
    }
    
    private func configureTitleLabel() {
        
        titleLabel.font = UIFont(name: "Helvetica Bold", size: 18)
        titleLabel.numberOfLines = 3
        titleLabel.minimumScaleFactor = 0.5
        titleLabel.adjustsFontSizeToFitWidth = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: 11),
            titleLabel.topAnchor.constraint(equalTo: newsImageView.topAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -5)
        ])
    }
    
    private func configureTagsLabel() {
        
        tagsLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 14)
        tagsLabel.textColor = .gray
        
        tagsLabel.numberOfLines = 2
        tagsLabel.minimumScaleFactor = 0.5
        
        tagsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tagsLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            tagsLabel.bottomAnchor.constraint(equalTo: newsImageView.bottomAnchor),
            tagsLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -5)
        ])
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


