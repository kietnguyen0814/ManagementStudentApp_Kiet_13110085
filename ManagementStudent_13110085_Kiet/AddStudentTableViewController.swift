//
//  AddStudentTableViewController.swift
//  ManagementStudent_13110085_Kiet
//
//  Created by Kiet Nguyen on 5/7/17.
//  Copyright © 2017 Kiet Nguyen. All rights reserved.
//

import UIKit

class AddStudentTableViewController: UITableViewController {

    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldID: UITextField!
    @IBOutlet weak var textFieldUni: UITextField!
    @IBOutlet weak var textFieldAge: UITextField!
    @IBOutlet weak var textViewDescript: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        // numberPad without "." button, decimalPad has "."
        textFieldAge.keyboardType = UIKeyboardType.numberPad
        textFieldID.keyboardType = UIKeyboardType.numberPad
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnSaveAction(_ sender: UIBarButtonItem) {
        if textFieldName.text!.isEmpty || textFieldID.text!.isEmpty || textFieldUni.text!.isEmpty ||  textViewDescript.text!.isEmpty ||  textViewDescript.text!.isEmpty {
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
            let student: Student = Student(named: textFieldName.text!, identify: textFieldID.text!, school: textFieldUni.text!, description: textViewDescript.text!, aged: String(describing: age))
            Constants.student = student
            self.navigationController?.popViewController(animated: true)
        }
    
    }
}
