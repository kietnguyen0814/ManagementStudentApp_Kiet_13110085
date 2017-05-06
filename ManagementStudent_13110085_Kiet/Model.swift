//
//  Model.swift
//  ManagementStudent_13110085_Kiet
//
//  Created by Kiet Nguyen on 5/7/17.
//  Copyright © 2017 Kiet Nguyen. All rights reserved.
//

import Foundation

class Student: NSObject {
    var name: String
    var id: String
    var university: String
    var descript: String
    var age: String
    
    init(named: String, identify: String, school: String, description: String, aged: String) {
        
        self.name = named
        self.id = identify
        self.university = school
        self.descript = description
        self.age = aged
        
    }
    
    class func createStudent() -> [Student]{
        var students = [Student]()
        
        students.append(Student(named: "Bill Gates", identify: "012", school: "Harvard", description: "Billionaire", aged: "62"))
        students.append(Student(named: "Mark Zuckerberg", identify: "345", school: "Harvard", description: "Billionaire", aged: "32"))
        students.append(Student(named: "Warren Buffett", identify: "456", school: "Columbia", description: "Billionaire", aged: "86"))
        
        return students
    }
}
