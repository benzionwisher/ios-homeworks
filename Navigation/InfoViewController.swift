//
//  InfoViewController.swift
//  Navigation
//
//  Created by Вишер Бенцион on 19.05.2023.
//

import UIKit

class InfoViewController: UIViewController {
    
    private lazy var alertButton: UIButton = {
        let button = UIButton()
        button.setTitle("уведомление", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(runAlert), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(alertButton)
        NSLayoutConstraint.activate([
            alertButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alertButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            alertButton.heightAnchor.constraint(equalToConstant: 50),
            alertButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    @objc func runAlert() {
            let alert = UIAlertController(title: "Заголовок", message: "Уведомление", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ок", style: .default) {_ in
                print("Ок!!!")
            }
            let okCancel = UIAlertAction(title: "Отмена", style: .default) {_ in
                print("Отмена!!!")
            }
            alert.addAction(okAction)
            alert.addAction(okCancel)
            present(alert, animated: true)
        }
    
    
    @objc func returnScreen() {
        dismiss(animated: true)
    }
}

