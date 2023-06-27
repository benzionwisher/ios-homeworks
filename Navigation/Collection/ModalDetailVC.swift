//
//  ModalDetailVC.swift
//  Navigation
//
//  Created by Вишер Бенцион on 27.06.2023.
//

import UIKit

class ModalDetailVC: UIViewController {
    var detailPost = Post(author: "", description: "", image: "", likes: 0, views: 0)
    

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .systemGray6
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var authorText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.text = "123"
        label.isUserInteractionEnabled = true
        return label
    }()
    
    private lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private let descriptionText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.systemGray
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var likes: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.isUserInteractionEnabled = true
        return label
    }()
    
    private let views: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        return label
    }()
    
    var parentNavigationControler: UINavigationController? = nil

    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupContraints()
        contentView.backgroundColor = .white
        scrollView.backgroundColor = .white
        view.backgroundColor = .white
        authorText.text = detailPost.author
        postImageView.image = UIImage(named: detailPost.image)
        descriptionText.text = detailPost.description
        likes.text = "Likes: " + String(detailPost.likes)
        views.text = "Views: " + String(detailPost.views)
        navigationController?.navigationBar.isHidden = false

    }
    
    
    //MARK: - Functions
    
    func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(authorText)
        contentView.addSubview(postImageView)
        contentView.addSubview(descriptionText)
        contentView.addSubview(likes)
        contentView.addSubview(views)
    }

    //MARK: - Constraints

    private func setupContraints() {
        
        let imageInset: CGFloat = 15
        let textInset: CGFloat = 20
        let safeAreaGuide = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            authorText.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            authorText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: textInset),
            
            postImageView.topAnchor.constraint(equalTo: authorText.bottomAnchor, constant: imageInset),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postImageView.heightAnchor.constraint(equalToConstant: 200),

            descriptionText.topAnchor.constraint(equalTo: postImageView.bottomAnchor),
            descriptionText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: textInset),
            descriptionText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            descriptionText.heightAnchor.constraint(equalToConstant: 50),

            // likes
            likes.topAnchor.constraint(equalTo: descriptionText.bottomAnchor),
            likes.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: textInset),
            likes.heightAnchor.constraint(equalToConstant: 50),
            likes.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            views.topAnchor.constraint(equalTo: descriptionText.bottomAnchor),
            views.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -textInset),
            views.heightAnchor.constraint(equalToConstant: 50),
            views.bottomAnchor.constraint(equalTo: likes.bottomAnchor)
        ])
    }
}


