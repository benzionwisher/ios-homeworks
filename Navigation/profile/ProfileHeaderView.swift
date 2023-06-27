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
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openBigAvatar)))
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.layer.cornerRadius = 60
        imageView.image = UIImage(named: "dog")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true

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
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField
    }()
    private var statusLabel: String = ""

    private lazy var closeBtn: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.image =  UIImage(systemName: "xmark.circle")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.layer.opacity = 0
        imageView.tintColor = .white
        imageView.isUserInteractionEnabled = true

        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeBigAvatar)))
        return imageView
    }()
    
    private let layerWhite: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.layer.opacity = 0.5
        view.isHidden = true
        return view
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

        if textField.text?.isEmpty == true {
            textField.shake()
        } else {
            titleStatus.text = textField.text
            print( textField.text ?? "Напишите статус")
        }

    }

    
    @objc func statusTextChanged(_ textField: UITextField) {
        if let titleStatus = textField.text {
            statusLabel = titleStatus
        }
    }
    
    func subview() {
        addSubview(titleName)
        addSubview(titleStatus)
        addSubview(button)
        addSubview(textField)
        addSubview(layerWhite)
        addSubview(imageView)
        addSubview(closeBtn)
    }

    func constrains() {
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 15),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25),
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
            
            
            
            layerWhite.leadingAnchor.constraint(equalTo: leadingAnchor),
            layerWhite.trailingAnchor.constraint(equalTo: trailingAnchor),
            layerWhite.topAnchor.constraint(equalTo: topAnchor),
            
            closeBtn.widthAnchor.constraint(equalToConstant: 30),
            closeBtn.heightAnchor.constraint(equalToConstant: 30),
            closeBtn.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            closeBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
        ])
    }
    @objc private func openBigAvatar() {
            
            let widthScreen = UIScreen.main.bounds.width
            let heightScreen = widthScreen * 2
            
            UIView.animate(withDuration: 0.2, animations: {
                self.imageView.transform = CGAffineTransform(scaleX: 4, y: 4)
                self.layerWhite.frame = .init(origin: CGPoint(x: 0, y: 0), size: CGSize(width: widthScreen, height: heightScreen))
                self.imageView.center = self.layerWhite.center
                self.imageView.layer.cornerRadius = 0
                self.layerWhite.isHidden = false
                  self.layerWhite.layer.opacity = 0.7
                self.imageView.layer.borderWidth = 0
            }) { _ in
                
                UIView.animate(withDuration: 0.3) {
                    self.closeBtn.alpha = 1
                }
            }
    }
    
    @objc private func closeBigAvatar() {

        UIView.animate(withDuration: 0.3, animations: {
            self.closeBtn.alpha = 0

        }) { _ in
            UIView.animate(withDuration: 0.2, animations: {
                self.imageView.layer.borderWidth = 3

                  self.layerWhite.layer.opacity = 0.0
                self.imageView.frame = .init(origin: CGPoint(x: 16, y: 16), size: CGSize(width: 100, height: 100))
                self.imageView.transform = .identity
                self.imageView.layer.cornerRadius = 60
            })
        }
    }
}

