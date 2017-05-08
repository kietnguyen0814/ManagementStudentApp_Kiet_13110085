//
//  Model.swift
//  ManagementStudent_13110085_Kiet
//
//  Created by Kiet Nguyen on 5/7/17.
//  Copyright © 2017 Kiet Nguyen. All rights reserved.
//

import Foundation
import UIKit

class Student: NSObject {
    var name: String
    var id: String
    var university: String
    var descript: String
    var age: String
    var image: UIImage
    
    init(named: String, identify: String, school: String, description: String, aged: String, imaged: UIImage) {
        self.name = named
        self.id = identify
        self.university = school
        self.descript = description
        self.age = aged
        self.image = imaged
    }
    
    class func createStudent() -> [Student]{
        var students = [Student]()
        
        students.append(Student(named: "Bill Gates", identify: "012", school: "Harvard", description: "Billionaire", aged: "62", imaged: #imageLiteral(resourceName: "billgates")))
        students.append(Student(named: "Mark Zuckerberg", identify: "345", school: "Harvard", description: "Billionaire", aged: "32", imaged: #imageLiteral(resourceName: "mark")))
        students.append(Student(named: "Warren Buffett", identify: "456", school: "Columbia", description: "Billionaire", aged: "86", imaged: #imageLiteral(resourceName: "warrent")))
        
        return students
    }
}
