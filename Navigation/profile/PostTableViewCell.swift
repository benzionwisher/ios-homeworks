//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Вишер Бенцион on 02.06.2023.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    var plusLike: (() -> Void)? = nil
    var plusView: (() -> Void)? = nil

    private let authorName: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionText: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.systemGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var likes: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true

        label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(pushLike)))

        return label
        
    }()
    
    private let views: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let contentLayer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var postImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onePost)))

        
        
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func pushLike() {
        if let action = self.plusLike { action() }
    }
    
    @objc func onePost() {
        if let action = self.plusView { action() }
    }
    
    func setupCell(model: Post) {
        
        likes.text = "Likes: "
        + String( model.likes)
        
        views.text = "Views: "
        + String(model.views)
        
        postImage.image = UIImage(named: model.image)
        authorName.text = model.author
        descriptionText.text = model.description
    }
    
    private func layout() {
        [contentLayer, authorName,postImage, descriptionText, likes, views].forEach { contentView.addSubview($0)
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            contentLayer.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentLayer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentLayer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            contentLayer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            postImage.topAnchor.constraint(equalTo: authorName.bottomAnchor, constant: 30),
            postImage.leadingAnchor.constraint(equalTo: contentLayer.leadingAnchor),
            postImage.trailingAnchor.constraint(equalTo: contentLayer.trailingAnchor),
            postImage.heightAnchor.constraint(equalTo: postImage.widthAnchor),
            
            
            authorName.topAnchor.constraint(equalTo: contentLayer.topAnchor, constant: 20),
            authorName.leadingAnchor.constraint(equalTo: contentLayer.leadingAnchor, constant: 15),
            authorName.trailingAnchor.constraint(equalTo: contentLayer.trailingAnchor, constant: 200),
            authorName.heightAnchor.constraint(equalToConstant: 35),
            
      
            descriptionText.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 10),
            descriptionText.leadingAnchor.constraint(equalTo: contentLayer.leadingAnchor, constant: 20),
            descriptionText.trailingAnchor.constraint(equalTo: contentLayer.trailingAnchor),
            descriptionText.heightAnchor.constraint(equalToConstant: 60),
            
            likes.topAnchor.constraint(equalTo: descriptionText.bottomAnchor),
            likes.leadingAnchor.constraint(equalTo: contentLayer.leadingAnchor, constant: 20),
            likes.heightAnchor.constraint(equalToConstant: 50),
            likes.bottomAnchor.constraint(equalTo: contentLayer.bottomAnchor),
            
            views.topAnchor.constraint(equalTo: descriptionText.bottomAnchor),
            views.trailingAnchor.constraint(equalTo: contentLayer.trailingAnchor, constant: -20),
            views.heightAnchor.constraint(equalToConstant: 50),
            views.bottomAnchor.constraint(equalTo: likes.bottomAnchor)
        ])
    }
}


