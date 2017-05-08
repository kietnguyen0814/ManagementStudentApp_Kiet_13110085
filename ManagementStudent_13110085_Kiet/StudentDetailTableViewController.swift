//
//  StudentDetailTableViewController.swift
//  ManagementStudent_13110085_Kiet
//
//  Created by Kiet Nguyen on 5/7/17.
//  Copyright © 2017 Kiet Nguyen. All rights reserved.
//

import UIKit

class StudentDetailTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var studentModel: Student!
    
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldID: UITextField!
    @IBOutlet weak var textFieldUni: UITextField!
    @IBOutlet weak var textFieldAge: UITextField!
    @IBOutlet weak var textViewDescript: UITextView!
    @IBOutlet weak var imgDetailStudent: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // numberPad without "." button, decimalPad has "."
        /*textFieldAge.keyboardType = UIKeyboardType.numberPad
        textFieldID.keyboardType = UIKeyboardType.numberPad*/
        textFieldName.text = studentModel.name
        textFieldID.text = studentModel.id
        textFieldAge.text = studentModel.age
        textFieldUni.text = studentModel.university
        textViewDescript.text = studentModel.descript
        imgDetailStudent.image = studentModel.image
    }
    
    override func viewWillAppear(_ animated: Bool) {
        studentModel.name = textFieldName.text!
        studentModel.id = textFieldID.text!
        studentModel.university = textFieldUni.text!
        studentModel.age = textFieldAge.text!
        studentModel.descript = textViewDescript.text!
        studentModel.image = imgDetailStudent.image!
    }
    
    // MARK: - Pick a picture
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        imgDetailStudent.image = image
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    //MARK : - User press choose image
    @IBAction func btnChooseImgAction(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
            
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: nil)
            }else{
                print("Camera not available")
            }
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action:UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    
    // MARK: - UITextFieldDelegate ( Keyboard will  disable when press return )
    // User must set delegate from this textfield to this view
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //textFieldName.resignFirstResponder()
        /*textFieldID.resignFirstResponder()
         textFieldAge.resignFirstResponder()
         textFieldUni.resignFirstResponder()*/
        if textFieldName.isEditing {
            textFieldName.resignFirstResponder()
        } else if textFieldUni.isEditing {
            textFieldUni.resignFirstResponder()
        }
        return true
    }
    
    // MARK: - UIScrollViewDelegate ( Keyboard will disable when scroll the UIView )
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        textFieldName.resignFirstResponder()
        textFieldID.resignFirstResponder()
        textFieldAge.resignFirstResponder()
        textFieldUni.resignFirstResponder()
        textViewDescript.resignFirstResponder()
    }
}
