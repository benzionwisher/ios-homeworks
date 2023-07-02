//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Вишер Бенцион on 08.06.2023.
//

import UIKit

class PhotosViewController: UIViewController {
     
    
    private let postImages = PostImages.maketPost()
    private var initialImageRect: CGRect = .zero
    
    private let transparentView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        view.backgroundColor = .black
        view.alpha = 0
        return view
    }()
    
    private lazy var crossButton: UIButton = {
        let button = UIButton(frame: CGRect(x: UIScreen.main.bounds.width - 80, y: 210, width: 80, height: 80))
        button.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        button.tintColor = .white
        button.alpha = 0
        button.addTarget(self, action: #selector(closeImage), for: .touchUpInside)
        return button
    }()
    
    private let animatingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var parentNavigationControler: UINavigationController? = nil

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemGray2
        collectionView.dataSource = self
        
        collectionView.register(
            PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        return collectionView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = false

        addSubviews()
        setupContraints()
        
        title = "Галерея"
    }
    
        
    private func addSubviews(){
        view.addSubview(collectionView)
    }
    

    private func setupContraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    @objc private func closeImage() {
        animateImageToInitial(rect: initialImageRect)
    }
    private func animateImageToInitial(rect: CGRect) {
        UIView.animate(withDuration: 0.3) {
            self.transparentView.alpha = 0
            self.animatingImageView.frame = rect
            self.animatingImageView.layer.cornerRadius = 0
        } completion: { _ in
            self.animatingImageView.removeFromSuperview()
            self.crossButton.alpha = 0
            self.transparentView.removeFromSuperview()
        }
    }
    
    private func animateImage(_ image: UIImage?, imageFrame: CGRect) {
        view.addSubview(transparentView)
        view.addSubview(crossButton)
        view.addSubview(animatingImageView)
        animatingImageView.image = image
        animatingImageView.alpha = 1.0
        animatingImageView.frame = CGRect(x: imageFrame.origin.x,
                                          y: imageFrame.origin.y,
                                          width: imageFrame.width,
                                          height: imageFrame.height)
        
        UIView.animate(withDuration: 0.3) {
            self.transparentView.alpha = 0.5
            self.animatingImageView.frame.size = CGSize(width: UIScreen.main.bounds.width,
                                                        height: UIScreen.main.bounds.width)
            self.animatingImageView.center = self.view.center
            self.animatingImageView.layer.cornerRadius = UIScreen.main.bounds.width / 2
        } completion: { _ in
            UIView.animate(withDuration: 0.1) {
                self.crossButton.alpha = 1
            }
        }
    }
    

}


extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        postImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell
        cell.delegate = self
        cell.setupCell(model: postImages[indexPath.row])
        cell.setIndexPath(indexPath)
        return cell
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    private var inset: CGFloat { return 8}
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - inset * 4) / 3
        return CGSize(width: width, height: width)
   }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
         inset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        inset
    }
}


extension PhotosViewController: CustomCellDelegate {
    func tapImageInCell(_ image: UIImage?, frameImage: CGRect, indexPath: IndexPath) {
      
        let rectItem = collectionView.layoutAttributesForItem(at: indexPath)
        
        let rectInSuperView = collectionView.convert(rectItem?.frame ?? .zero, to: collectionView.superview)
        
        initialImageRect = CGRect(x: frameImage.origin.x + rectInSuperView.origin.x,
                                  y: frameImage.origin.y + rectInSuperView.origin.y,
                                  width: frameImage.width,
                                  height: frameImage.height)
        
        animateImage(image, imageFrame: initialImageRect)
    }
}
