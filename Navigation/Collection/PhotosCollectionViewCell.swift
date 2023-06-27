//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Вишер Бенцион on 08.06.2023.
//

import UIKit


protocol CustomCellDelegate: AnyObject {
    func tapImageInCell(_ image: UIImage?, frameImage: CGRect, indexPath: IndexPath)
}


 class PhotosCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: CustomCellDelegate?
    private var indexPathCell = IndexPath()


    private lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true

        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapImage)))

        return imageView
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        custmizeCell()
        addSubviews()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func custmizeCell() {
    }
    
    func setupCell(model: PostImages) {
        postImageView.image = UIImage(named: model.image)
    }

    private func addSubviews(){
        contentView.addSubview(postImageView)
    }
     
     func setIndexPath(_ indexPath: IndexPath) {
         indexPathCell = indexPath
     }
        
    private func setupContraints() {
        
        NSLayoutConstraint.activate([
            postImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
     
     @objc private func tapImage() {
         delegate?.tapImageInCell(postImageView.image, frameImage: postImageView.frame, indexPath: indexPathCell)
     }
}
