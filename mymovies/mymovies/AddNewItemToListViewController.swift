//
//  AddNewItemToListViewController.swift
//  Movies
//
//  Created by Mariam Mchedlidze on 29.10.23.
//

import UIKit

class AddNewItemToListViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK - Properties
    
    private let addForm: UIStackView = {
        let addFormStack = UIStackView()
        addFormStack.axis = .vertical
        addFormStack.spacing = 24
        return addFormStack
    }()
    
    private let addTitle: UITextField = {
        let title = UITextField()
        title.text = "Enter Title"
        title.textColor = UIColor(red: 255/255, green: 209/255, blue: 89/255, alpha: 1)
        title.layer.borderWidth = 1
        title.layer.borderColor = CGColor(red: 255/255, green: 209/255, blue: 89/255, alpha: 1)
        title.layer.cornerRadius = 16
        title.textAlignment = .center
        return title
    }()
    
    private let addImage: UIButton = {
        let button = UIButton()
        button.setTitle("Upload Image", for: .normal)
        button.layer.backgroundColor = CGColor(red: 255/255, green: 209/255, blue: 89/255, alpha: 1)
        button.setTitleColor(UIColor(red: 1/255, green: 5/255, blue: 38/255, alpha: 1), for: .normal)
        button.layer.cornerRadius = 16
        return button
    }()
    
    private let saveItem: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.layer.backgroundColor = CGColor(red: 255/255, green: 209/255, blue: 89/255, alpha: 1)
        button.setTitleColor(UIColor(red: 1/255, green: 5/255, blue: 38/255, alpha: 1), for: .normal)
        button.layer.cornerRadius = 16
        return button
    }()
    
    
    private let selectedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddform()
        AddFormConstraints()
        setActions()
        ImageConstraints()
        
        
    }
    
    // MARK - Form Setup
    
    private func setupAddform() {
        view.backgroundColor = UIColor(red: 1/255, green: 5/255, blue: 38/255, alpha: 1)
        view.addSubview(addForm)
        addForm.addArrangedSubview(addTitle)
        addForm.addArrangedSubview(addImage)
        addForm.addArrangedSubview(saveItem)
        view.addSubview(selectedImageView)
        saveItem.addTarget(self, action: #selector(saveItemTapped), for: .touchUpInside)
        
    }
    
    private func AddFormConstraints() {
        addForm.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addForm.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            addForm.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addTitle.widthAnchor.constraint(equalToConstant: 260),
            addTitle.heightAnchor.constraint(equalToConstant: 40),
            addImage.heightAnchor.constraint(equalToConstant: 40),
            saveItem.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    private func ImageConstraints() {
        selectedImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            selectedImageView.topAnchor.constraint(equalTo: addForm.bottomAnchor, constant: 20),
            selectedImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            selectedImageView.heightAnchor.constraint(equalToConstant: 200),
            selectedImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    //MARK - Add Actions
    
    private func setActions() {
        addTitle.delegate = self
        addImage.addTarget(self, action: #selector(uploadImageTapped), for: .touchUpInside)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    @objc func uploadImageTapped() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            selectedImageView.image = selectedImage }
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    @objc func saveItemTapped() {
        guard let title = addTitle.text, !title.isEmpty, let image = selectedImageView.image else {
            displayErrorAlert(message: "Title or Image is empty!")
            return
        }
        
        let newMovie = Movie(number: "\(Movie.dummyData.count + 1)", name: title, imageName: "newMoviePoster")
        Movie.dummyData.append(newMovie)
        
        navigationController?.popViewController(animated: true)
    }
    
    private func displayErrorAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        
    }
}
