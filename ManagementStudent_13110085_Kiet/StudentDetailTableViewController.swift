//
//  StudentDetailTableViewController.swift
//  ManagementStudent_13110085_Kiet
//
//  Created by Kiet Nguyen on 5/7/17.
//  Copyright © 2017 Kiet Nguyen. All rights reserved.
//

import UIKit

class StudentDetailTableViewController: UITableViewController {

    var studentModel:Student!
    
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldID: UITextField!
    @IBOutlet weak var textFieldUni: UITextField!
    @IBOutlet weak var textFieldAge: UITextField!
    @IBOutlet weak var textViewDescript: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        textFieldName.text = studentModel.name
        textFieldID.text = studentModel.id
        textFieldAge.text = studentModel.age
        textFieldUni.text = studentModel.university
        textViewDescript.text = studentModel.descript
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
