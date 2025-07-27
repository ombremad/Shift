//
//  UserProfil.swift
//  Shift
//
//  Created by alize on 27/07/2025.
//

import UIKit

class ViewController: UIViewController {
    private let titlePage: UILabel = {
        var label = UILabel()
        label.text = "Profile settings"
        label.textColor = .noir
        label.textAlignment = .left
        label.font = UIFont(name: "Safiro-SemiBold", size: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let userImage: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "ProfileImage")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let changeImageButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Upload picture", for: .normal)
       // button.font = UIFont(name: "Safiro-SemiBold", size: 32) ça marche pas !!!
        button.setTitleColor(.blanc, for: .normal)
        button.backgroundColor = .violet
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let name: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textColor = .noir
        label.textAlignment = .left
        label.font = UIFont(name: "Safiro-SemiBold", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Your name"
        textField.borderStyle = .roundedRect
        textField.textColor = .grisForm
        textField.backgroundColor = .blanc
        textField.font = UIFont(name: "helveticaNeue-Courant", size: 14)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let nickname: UILabel = {
        let label = UILabel()
        label.text = "Nickname"
        label.textColor = .noir
        label.textAlignment = .left
        label.font = UIFont(name: "Safiro-SemiBold", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nicknameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Your nickname"
        textField.borderStyle = .roundedRect
        textField.textColor = .grisForm
        textField.backgroundColor = .blanc
        textField.font = UIFont(name: "helveticaNeue-Courant", size: 14)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let country: UILabel = {
        let label = UILabel()
        label.text = "Country"
        label.textColor = .noir
        label.textAlignment = .left
        label.font = UIFont(name: "Safiro-SemiBold", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let countryTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Your country"
        textField.borderStyle = .roundedRect
        textField.textColor = .grisForm
        textField.backgroundColor = .blanc
        textField.font = UIFont(name: "helveticaNeue-Courant", size: 14)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let city: UILabel = {
        let label = UILabel()
        label.text = "City"
        label.textColor = .noir
        label.textAlignment = .left
        label.font = UIFont(name: "Safiro-SemiBold", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let cityTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Your city"
        textField.borderStyle = .roundedRect
        textField.textColor = .grisForm
        textField.backgroundColor = .blanc
        textField.font = UIFont(name: "helveticaNeue-Courant", size: 14)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.blanc, for: .normal)
        button.backgroundColor = .violet
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        view.addSubview(titlePage)
        view.addSubview(userImage)
        view.addSubview(changeImageButton)
        view.addSubview(name)
        view.addSubview(nameTextField)
        view.addSubview(nickname)
        view.addSubview(nicknameTextField)
        view.addSubview(country)
        view.addSubview(countryTextField)
        view.addSubview(city)
        view.addSubview(cityTextField)
        view.addSubview(saveButton)

        NSLayoutConstraint.activate([
                   titlePage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                   titlePage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
                   
                   userImage.topAnchor.constraint(equalTo: titlePage.bottomAnchor, constant: 35),
                   userImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                   userImage.widthAnchor.constraint(equalToConstant: 92),
                   userImage.heightAnchor.constraint(equalToConstant: 92),
                   
                   changeImageButton.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 10),
                   changeImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                   changeImageButton.widthAnchor.constraint(equalToConstant: 167),
                   changeImageButton.heightAnchor.constraint(equalToConstant: 40),
                   
                   name.topAnchor.constraint(equalTo: changeImageButton.bottomAnchor, constant: 20),
                   name.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
                   
                   nameTextField.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10),
                   nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
                   nameTextField.widthAnchor.constraint(equalToConstant: 372),
                   nameTextField.heightAnchor.constraint(equalToConstant: 44),
                   
                   nickname.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
                   nickname.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
                   
                   nicknameTextField.topAnchor.constraint(equalTo: nickname.bottomAnchor, constant: 10),
                   nicknameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
                   nicknameTextField.widthAnchor.constraint(equalToConstant: 372),
                   nicknameTextField.heightAnchor.constraint(equalToConstant: 44),
                   
                   country.topAnchor.constraint(equalTo: nicknameTextField.bottomAnchor, constant: 20),
                   country.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
                   
                   countryTextField.topAnchor.constraint(equalTo: country.bottomAnchor, constant: 10),
                   countryTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
                   countryTextField.widthAnchor.constraint(equalToConstant: 372),
                   countryTextField.heightAnchor.constraint(equalToConstant: 44),
                   
                   city.topAnchor.constraint(equalTo: countryTextField.bottomAnchor, constant: 20),
                   city.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
                   
                   cityTextField.topAnchor.constraint(equalTo: city.bottomAnchor, constant: 10),
                   cityTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
                   cityTextField.widthAnchor.constraint(equalToConstant: 372),
                   cityTextField.heightAnchor.constraint(equalToConstant: 44),
                   
                   saveButton.topAnchor.constraint(equalTo: cityTextField.bottomAnchor , constant: 30),
                   saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                   saveButton.widthAnchor.constraint(equalToConstant: 167),
                   saveButton.heightAnchor.constraint(equalToConstant: 40),
               ])
       
    }
    //pour mettre image en rond après ajout layout
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        userImage.layer.cornerRadius = userImage.frame.size.width / 2
    }
}

