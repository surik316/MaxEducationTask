//
//  ContentView.swift
//  MaxEducationTask
//
//  Created by Максим Сурков on 24.04.2021.
//

import Foundation
import UIKit
class ContentView: UIView {
    
    
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let sourceLabel = UILabel()
    let dateLabel = UILabel()
    let descriptionLabel = UILabel()
    let autorLabel = UILabel()
    let copyrightLabel = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureTitleLabel()
        configureImageView()
        configureSourceLabel()
        configureDateLabel()
        configureDescriptionLabel()
        configureAutorLabel()
        configureCopyrightLabel()
    }
    private func configureTitleLabel() {
        addSubview(titleLabel)
        titleLabel.font = UIFont(name: "Prata-Regular", size: 40)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .left
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -32)
        ])
    }
    
    private func configureImageView() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
    }
    private func configureSourceLabel() {
        addSubview(sourceLabel)
        sourceLabel.font = UIFont(name: "Helvetica", size: 12)
        sourceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sourceLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 3),
            sourceLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func configureDateLabel() {
        addSubview(dateLabel)
        dateLabel.font = UIFont(name: "Helvetica", size: 12)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: sourceLabel.bottomAnchor, constant: 2),
            dateLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor)
        ])
    }
    private func configureDescriptionLabel() {
        addSubview(descriptionLabel)
        descriptionLabel.font = UIFont(name: "Prata-Regular", size: 24)
        descriptionLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 13),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
        ])
    }
    private func configureAutorLabel() {
        addSubview(autorLabel)
        autorLabel.font = UIFont(name: "Prata-Regular", size: 24)
        autorLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            autorLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 6),
            autorLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor)
        ])
    }
    private func configureCopyrightLabel() {
        addSubview(copyrightLabel)
        copyrightLabel.font = UIFont(name: "Helvetica", size: 9)
        copyrightLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            copyrightLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            copyrightLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
