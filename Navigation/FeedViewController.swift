//
//  FeedViewController.swift
//  Navigation
//
//  Created by Вишер Бенцион on 19.05.2023.
//

import UIKit

class FeedViewController: UIViewController {
    
    private lazy var postBut: UIButton = {
        let button = UIButton()
        button.setTitle("Пост", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        
        return button
    }()
    
    let postName: Post = .init(title: "Пост1")
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            postBut.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            postBut.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            postBut.heightAnchor.constraint(equalToConstant: 50),
            postBut.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    @objc func showPage () {
        let postViewController = PostViewController()
        postViewController.postName = postName.title
        navigationController?.pushViewController(postViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        postBut.addTarget(self, action: #selector(showPage), for: .touchUpInside)
        view.addSubview(postBut)
        setConstraints()
        
    }
    


}
