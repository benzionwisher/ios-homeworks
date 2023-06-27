//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Вишер Бенцион on 19.05.2023.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate {
    
    private var postFeed = Post.createPost()

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        tableView.register(PhotosSlideController.self, forCellReuseIdentifier: PhotosSlideController.identifier)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        setupContraints()
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    
    }
    
    
    private func addSubviews(){
        view.addSubview(tableView)
    }
    
    func pushPhotosViewController() {
        let photosVC = PhotosViewController()
        photosVC.parentNavigationControler = self.navigationController
        navigationController?.pushViewController(photosVC, animated: true)
        
    }
    
}


extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0   {
            return 1
        }
        else {
            return  postFeed.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if indexPath.section == 0  {
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotosSlideController.identifier, for: indexPath) as! PhotosSlideController
                cell.callBack = pushPhotosViewController
            return cell
        } else  {
            let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
            cell.setupCell(model: postFeed[indexPath.row])
            
            cell.plusView = {
                let modalDetailVC = ModalDetailVC()
                self.postFeed[indexPath.row].views += 1
                self.tableView.reloadData()
                modalDetailVC.detailPost = self.postFeed[indexPath.row]
                modalDetailVC.parentNavigationControler = self.navigationController
                self.navigationController?.present(modalDetailVC, animated: true)
            }
            
            
            cell.plusLike = {
                    self.postFeed[indexPath.row].likes += 1
                    self.tableView.reloadData()
//                }
            }
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return ProfileHeaderView()
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 150
        }
        return tableView.rowHeight
    }
    

}




extension UIView {
    static var identifier: String {
        String(describing: self)
    }
}

extension ProfileViewController {
    private func setupContraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
