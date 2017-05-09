//
//  AddStudentTableViewController.swift
//  ManagementStudent_13110085_Kiet
//
//  Created by Kiet Nguyen on 5/7/17.
//  Copyright © 2017 Kiet Nguyen. All rights reserved.
//

import UIKit

class AddStudentTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldID: UITextField!
    @IBOutlet weak var textFieldUni: UITextField!
    @IBOutlet weak var textFieldAge: UITextField!
    @IBOutlet weak var textViewDescript: UITextView!
    @IBOutlet weak var imgAddStudent: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        // numberPad without "." button, decimalPad has "."
        /*textFieldAge.keyboardType = UIKeyboardType.numberPad
        textFieldID.keyboardType = UIKeyboardType.numberPad*/
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Pick a picture
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        imgAddStudent.image = image
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
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
    
    //MARK :- User press button Save
    @IBAction func btnSaveAction(_ sender: UIBarButtonItem) {
        if textFieldName.text!.isEmpty || textFieldID.text!.isEmpty || textFieldUni.text!.isEmpty ||  textViewDescript.text!.isEmpty ||  textViewDescript.text!.isEmpty || imgAddStudent.image == nil{
            //create alert
            let alert = UIAlertController(title: "Notification", message: "Please enter full information", preferredStyle: UIAlertControllerStyle.alert);
            //add an action
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil));
            //show alert
            self.present(alert, animated: true, completion: nil);
            
        }
        else {
            Constants.isLoadDataAgain = true
            let age = Int(textFieldAge.text!)! // "!"unwraped optional
            let student: Student = Student(named: textFieldName.text!, identify: textFieldID.text!, school: textFieldUni.text!, description: textViewDescript.text!, aged: String(describing: age), imaged: imgAddStudent.image!)
            Constants.student = student
            // Back To Management Student Screen
            self.navigationController?.popViewController(animated: true)
        }
    
    }
    
    // UITextFieldDelegate ( Keyboard will  disable when press return )
    // User must set delegate from this textfield to this view
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textFieldName.isEditing {
            textFieldID.becomeFirstResponder()
        } else if textFieldUni.isEditing {
            textFieldAge.becomeFirstResponder()
        }
        return true
    }
    
    // UIScrollViewDelegate ( Keyboard will disable when scroll the UIView )
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        textFieldName.resignFirstResponder()
        textFieldID.resignFirstResponder()
        textFieldAge.resignFirstResponder()
        textFieldUni.resignFirstResponder()
        textViewDescript.resignFirstResponder()
    }
}
