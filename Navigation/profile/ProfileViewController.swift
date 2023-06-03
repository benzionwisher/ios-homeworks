//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Вишер Бенцион on 19.05.2023.
//

import UIKit


class ProfileViewController: UIViewController {
    
    let profileHeaderView = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"

        view.backgroundColor = .lightGray
        subview()
        addLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    
    func subview() {
        view.addSubview(profileHeaderView)
        view.addSubview(pushButton)
    }
    
    func addLayout() {
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            pushButton.heightAnchor.constraint(equalToConstant: 50),pushButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0),
            pushButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 0),
            pushButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: 0),
        ])
    }
    
    private let pushButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("кнопка", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "ColorBlue")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
}

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


