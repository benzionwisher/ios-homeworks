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

        view.backgroundColor = .lightGray
        addLayout()
    }
    
    func addLayout() {
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileHeaderView)

        NSLayoutConstraint.activate([
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        ])
        profileHeaderView.frame = view.frame
    }
}

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


