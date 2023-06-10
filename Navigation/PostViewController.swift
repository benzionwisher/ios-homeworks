//
//  PostViewController.swift
//  Navigation
//
//  Created by Вишер Бенцион on 19.05.2023.
//

import UIKit

class PostViewController: UIViewController {
   
    var postName: String?
    
    lazy var infoBut: UIButton = {
        let button = UIButton()
        button.setImage(
            UIImage(systemName: "info")?.withRenderingMode(.alwaysTemplate),
            for: .normal)
        button.tintColor = .systemBlue
        button.imageView?.contentMode = .scaleAspectFit
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        return button
    }()
    
    lazy var barBtn: UIBarButtonItem = {
    var buttom = UIBarButtonItem()
        buttom = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(infoButRun))
        return buttom
    }()
//
    
    @objc private func infoButRun() {
        let infoViewController = InfoViewController()
        present(infoViewController,animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = barBtn
//        infoBut.addTarget(self, action: #selector(infoButRun), for: .touchUpInside)
    }
}
