//
//  UserProfil.swift
//  Shift
//
//  Created by alize on 27/07/2025.
//

import UIKit

class ViewController: UIViewController {
    var userModel = UserModel()
    private var selectedImage: UIImage?
    
    private let darkModeLabel: UILabel = {
        let label = UILabel()
        label.text = "Switch to Dark mode"
        label.textColor = .noir
        label.textAlignment = .left
        label.font = UIFont(name: "Safiro-SemiBold", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let darkModeToggle: UISwitch = {
        let toggle = UISwitch()
        toggle.isOn = false
        toggle.onTintColor = .violet
        toggle.translatesAutoresizingMaskIntoConstraints = false
        return toggle
    }()
    
    private lazy var darkModeStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [darkModeLabel, darkModeToggle])
        stack.axis = .horizontal
        stack.spacing = 10
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
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
        button.titleLabel?.font = UIFont(name: "Safiro-SemiBold", size: 16)
        button.setTitleColor(.white, for: .normal)
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
        textField.placeholder = ""
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .blanc
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isUserInteractionEnabled = false  // pour que le champs ne soit pas modifiable
        textField.textColor = .grisForm
        textField.font = UIFont(name: "helveticaNeue-Courant", size: 14)
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
        textField.borderStyle = .roundedRect
        textField.textColor = .grisForm
        textField.backgroundColor = .blanc
        textField.font = UIFont(name: "helveticaNeue-Courant", size: 14)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(
               string: "Your nickname",
               attributes: [NSAttributedString.Key.foregroundColor: UIColor.grisForm]
           )
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
        textField.attributedPlaceholder = NSAttributedString(
               string: "Your city",
               attributes: [NSAttributedString.Key.foregroundColor: UIColor.grisForm]
           )
        return textField
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Save", for: .normal)
        button.titleLabel?.font = UIFont(name: "Safiro-SemiBold", size: 16)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .violet
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let message: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .noir
        label.textAlignment = .left
        label.font = UIFont(name: "helveticaNeue-Courant", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        view.addSubview(titlePage)
        view.addSubview(userImage)
        view.addSubview(changeImageButton)
        view.addSubview(darkModeLabel)
        view.addSubview(darkModeToggle)
        view.addSubview(darkModeStack)
        view.addSubview(name)
        view.addSubview(nameTextField)
        view.addSubview(nickname)
        view.addSubview(nicknameTextField)
        view.addSubview(city)
        view.addSubview(cityTextField)
        view.addSubview(saveButton)
        view.addSubview(message)

        NSLayoutConstraint.activate([
                   titlePage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
                   titlePage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
                   
                   userImage.topAnchor.constraint(equalTo: titlePage.bottomAnchor, constant: 35),
                   userImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                   userImage.widthAnchor.constraint(equalToConstant: 92),
                   userImage.heightAnchor.constraint(equalToConstant: 92),
                   
                   changeImageButton.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 10),
                   changeImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                   changeImageButton.widthAnchor.constraint(equalToConstant: 167),
                   changeImageButton.heightAnchor.constraint(equalToConstant: 40),
                   
                   darkModeStack.topAnchor.constraint(equalTo: changeImageButton.bottomAnchor, constant: 50),
                   darkModeStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
                   darkModeStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),

                   name.topAnchor.constraint(equalTo: darkModeStack.bottomAnchor, constant: 20),
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
                   
                   city.topAnchor.constraint(equalTo: nicknameTextField.bottomAnchor, constant: 20),
                   city.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
                   
                   cityTextField.topAnchor.constraint(equalTo: city.bottomAnchor, constant: 10),
                   cityTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
                   cityTextField.widthAnchor.constraint(equalToConstant: 372),
                   cityTextField.heightAnchor.constraint(equalToConstant: 44),
                   
                   saveButton.topAnchor.constraint(equalTo: cityTextField.bottomAnchor , constant: 30),
                   saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                   saveButton.widthAnchor.constraint(equalToConstant: 167),
                   saveButton.heightAnchor.constraint(equalToConstant: 40),
                   
                   message.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 10),
                   message.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               ])
        // Pour recuperer le nom enregistrer dans UserViewModel
        let currentUser = userModel.getCurrentUser()
            nameTextField.text = currentUser.name
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       
        //pour mettre image en rond après ajout layout
        userImage.layer.cornerRadius = userImage.frame.size.width / 2
        
        saveButton.addTarget(self, action: #selector(saveButtonAction), for: .touchUpInside)
        
        darkModeToggle.addTarget(self, action: #selector(toggleChanged), for: .valueChanged)
        
        changeImageButton.addTarget(self, action: #selector(openGallery), for: .touchUpInside)
        
    }
    //Fonction pour récupérer les champs de textField (sauf name deja enregistré) dans le userViewModel - currentUser
    @objc func saveButtonAction(){
        let name = userModel.getCurrentUser().name
        let nickname = nicknameTextField.text ?? ""
        let city = cityTextField.text ?? ""
       // let picture = userModel.getCurrentUser().picture
        let picture = userModel.getCurrentUser().picture
        let interest = userModel.getCurrentUser().interests
        
        if !nickname.isEmpty && !city.isEmpty {
            userModel.setCurrentUser(name: name, nickname: nickname, picture: picture, city: city, interests: interest)
            message.text = "Saved Profile!"
            message.textColor = .violet
    print(userModel.getCurrentUser())
      } else {
          message.text = "Error: one of the fields is empty."
          message.textColor = .red
      }
        //Sauvegarde la préférence dark mode/light mode
        UserDefaults.standard.set(darkModeToggle.isOn, forKey: "isDarkMode")
    }
    
    @objc func toggleChanged(_ sender: UISwitch) {
        // Appliquer le dark mode à toute l'app
               if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                  let window = windowScene.windows.first {
                   window.overrideUserInterfaceStyle = sender.isOn ? .dark : .light
               }
        overrideUserInterfaceStyle = sender.isOn ? .dark : .light
    }
    @objc private func openGallery() {
          let picker = UIImagePickerController()
          picker.sourceType = .photoLibrary
          picker.delegate = self
          present(picker, animated: true)
      }
}
// MARK: - Image Picker
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // Récupérer l'image
        if let image = info[.originalImage] as? UIImage {
            userImage.image = image
            selectedImage = image
        }
        // Fermer la galerie
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
