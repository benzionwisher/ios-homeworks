//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Вишер Бенцион on 23.05.2023.
//

import UIKit
class ProfileHeaderView: UIView {
    
    

    
    
    private let titleName: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "My Dog"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Статус", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "ColorBlue")
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(btnTap), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false

        
        return button
    }()
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.layer.cornerRadius = 60
        imageView.image = UIImage(named: "dog")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()
    
    var titleStatus: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.text = "Статус"
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.minimumFontSize = 15
        textField.layer.cornerRadius = 12
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1.0
        textField.placeholder = "Статус"
        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        subview()
        constrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var statusText: String = ""

    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    @objc func btnTap() {
        print( textField.text ?? "Напишите статус")
        
    }
    
    func subview() {
        addSubview(imageView)
        addSubview(titleName)
        addSubview(titleStatus)
        addSubview(button)
        addSubview(textField)
    }

    func constrains() {
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 15),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            imageView.widthAnchor.constraint(equalToConstant: 120),
            imageView.heightAnchor.constraint(equalToConstant: 120),
            titleStatus.leadingAnchor.constraint(equalTo: titleName.leadingAnchor),
            titleStatus.topAnchor.constraint(equalTo: titleName.bottomAnchor, constant: 15),
            titleStatus.widthAnchor.constraint(equalToConstant: 170),
            titleName.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            titleName.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            titleName.widthAnchor.constraint(equalToConstant: 190),
            textField.topAnchor.constraint(equalTo: titleStatus.bottomAnchor, constant: 12),
            textField.heightAnchor.constraint(equalToConstant: 50),
            textField.widthAnchor.constraint(equalToConstant: 210),
            textField.leadingAnchor.constraint(equalTo: titleName.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
}
