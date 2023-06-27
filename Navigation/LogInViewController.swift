//
//  LogInViewController.swift
//  Navigation
//
//  Created by Вишер Бенцион on 30.05.2023.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    private let colorSet = UIColor(named: "ColorBlue")
    

    private let ImagelogoView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
     
        scrollView.translatesAutoresizingMaskIntoConstraints = false
return scrollView
    }()
    
    private let contentPageView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
      
        return view
    }()
    
    private lazy var loginTextField: UITextField = {
        let textField = UITextField()    //
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16, weight: .medium)
        textField.textAlignment = .left
        textField.placeholder = "Логин"
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        textField.backgroundColor = .systemGray6
        textField.tintColor = colorSet
        textField.autocapitalizationType = .none
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private let  sepor: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray4
        return view
    }()
    
    private let stackText: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10
        stackView.clipsToBounds = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()    //
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16, weight: .medium)
        textField.textAlignment = .left
        textField.placeholder = "Пароль"
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        textField.backgroundColor = .systemGray6 //
        textField.isSecureTextEntry = true
        textField.tintColor = colorSet
        textField.autocapitalizationType = .none
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private var warningLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        label.textColor = .red
        label.text = "Password is too short!"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        return label
    }()
    

    private lazy var  loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.addTarget(self, action: #selector(pushLogin), for: .touchUpInside)
        switch button.state {
        case .normal      : button.alpha = 1
        case .selected    : button.alpha = 0.8
        default: button.alpha = 1
        }
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    private let countPassword = 6
    private let correctUserName = "admin"
    private let correctPassword = "qwerty123"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        setConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
        
    @objc private func pushLogin() {
            
            if loginTextField.text?.isEmpty == true {
                loginTextField.shake()
                return
            }
            
            if passwordTextField.text?.isEmpty == true {
               passwordTextField.shake()
                return
            }
            
            if let password = passwordTextField.text, password.count < countPassword {
                warningLabel.text = "Пароль должен быть более 5 символов"
                warningLabel.isHidden = false
                return
            }
         
            if loginTextField.text != correctUserName || passwordTextField.text != correctPassword {
                let alert = UIAlertController(title: "Ошибка", message: "Неправильный логин или пароль", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
                return
            }
            
            let profileViewController = ProfileViewController()
            navigationController?.pushViewController(profileViewController, animated: true)
        warningLabel.isHidden = true
        }
    
    
    
    
    @objc private func keyboardShow(notification: NSNotification) {
        if let keyboardSize: CGRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height + loginButton.frame.height + 16
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0,
                                                                    left: 0,
                                                                    bottom: keyboardSize.height + loginButton.frame.height + 16,
                                                                    right: 0)
        }
    }
    
    @objc private func keyboardHide() {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentPageView)
        contentPageView.addSubview(ImagelogoView)
        contentPageView.addSubview(stackText)
        stackText.addArrangedSubview(loginTextField)
        stackText.addArrangedSubview(sepor)
        stackText.addArrangedSubview(passwordTextField)
        contentPageView.addSubview(loginButton)
        scrollView.addSubview(warningLabel)

    }
    
    private func setConstraints() {

        let widthInset = view.frame.width - 32
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            contentPageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentPageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentPageView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentPageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentPageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            ImagelogoView.topAnchor.constraint(equalTo: contentPageView.topAnchor, constant: 120),
            ImagelogoView.centerXAnchor.constraint(equalTo: contentPageView.centerXAnchor),
            ImagelogoView.heightAnchor.constraint(equalToConstant: 100),
            ImagelogoView.widthAnchor.constraint(equalToConstant: 100),
            
            loginTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.topAnchor.constraint(equalTo: sepor.bottomAnchor, constant: 0),
            passwordTextField.heightAnchor.constraint(equalToConstant: 49),
                        sepor.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 0),
           
            sepor.heightAnchor.constraint(equalToConstant: 1),
            sepor.widthAnchor.constraint(equalToConstant:  widthInset),
            
            stackText.topAnchor.constraint(equalTo: ImagelogoView.bottomAnchor, constant: 120),
           
            passwordTextField.centerXAnchor.constraint(equalTo: contentPageView.centerXAnchor),
            passwordTextField.widthAnchor.constraint(equalToConstant:  widthInset),
            
            warningLabel.topAnchor.constraint(equalTo: stackText.bottomAnchor, constant: 30),
            warningLabel.leadingAnchor.constraint(equalTo: stackText.leadingAnchor),
            
            
            loginButton.topAnchor.constraint(equalTo: warningLabel.bottomAnchor, constant: 16),
            loginButton.centerXAnchor.constraint(equalTo: contentPageView.centerXAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.widthAnchor.constraint(equalToConstant:  widthInset),
            loginButton.bottomAnchor.constraint(equalTo: contentPageView.bottomAnchor),
        ])
    }
}

extension UIView {
    func shake(count : Float = 4,for duration : TimeInterval = 0.3,withTranslation translation : Float = 5) {

        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.repeatCount = count
        animation.duration = duration/TimeInterval(animation.repeatCount)
        animation.autoreverses = true
        animation.values = [translation, -translation]
        layer.add(animation, forKey: "shake")
    }
}
