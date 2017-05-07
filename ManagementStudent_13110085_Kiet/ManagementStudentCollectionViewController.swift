//
//  ManagementStudentCollectionViewController.swift
//  ManagementStudent_13110085_Kiet
//
//  Created by Kiet Nguyen on 5/7/17.
//  Copyright © 2017 Kiet Nguyen. All rights reserved.
//

import UIKit

enum selectedScope:Int {
    case name = 0
    case id = 1
    case age = 2
    case university = 3
}


class MangementStudentTableViewController: UITableViewController, UISearchBarDelegate{
    //let searchController = UISearchController(searchResultsController: nil)
    let searchBar = UISearchBar(frame: CGRect(x:0,y:0,width:(UIScreen.main.bounds.width),height:70))
    
    //get all students
    lazy var students: [Student] = {
        return Student.createStudent()
    }()
    //get initial students for search
    lazy var initialStudent: [Student] = {
        return Student.createStudent()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = editButtonItem
        self.searchBarSetup()
    }
    
    func searchBarSetup() {
        searchBar.showsScopeBar = true
        searchBar.scopeButtonTitles = ["Name","ID","Age","University"]
        searchBar.selectedScopeButtonIndex = 0
        searchBar.delegate = self
        self.tableView.tableHeaderView = searchBar
    }
    
    
    // MARK: - search bar delegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        tableView.reloadData()
        if searchText.isEmpty {
            students = initialStudent
            self.tableView.reloadData()
        }else {
            print(initialStudent)
            filterTableView(ind: searchBar.selectedScopeButtonIndex, text: searchText)
            tableView.reloadData()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.showsCancelButton = false
        return true
    }
    
    func filterTableView(ind:Int,text:String) {
        tableView.reloadData()
        switch ind {
        case selectedScope.name.rawValue:
            //fix of not searching when backspacing
            students = initialStudent.filter({ (stu) -> Bool in
                return stu.name.lowercased().contains(text.lowercased())
            })
            self.tableView.reloadData()
            
        case selectedScope.id.rawValue:
            //fix of not searching when backspacing
            students = initialStudent.filter({ (stu) -> Bool in
                return stu.id.lowercased().contains(text.lowercased())
            })
            self.tableView.reloadData()
            
        case selectedScope.age.rawValue:
            //fix of not searching when backspacing
            students = initialStudent.filter({ (stu) -> Bool in
                return stu.age.lowercased().contains(text.lowercased())
            })
            self.tableView.reloadData()
            
        case selectedScope.university.rawValue:
            //fix of not searching when backspacing
            students = initialStudent.filter({ (stu) -> Bool in
                return stu.university.lowercased().contains(text.lowercased())
            })
            self.tableView.reloadData()
        default:
            print("No Type Found!!!")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initialStudent = students // reload initialStudent
        if Constants.isLoadDataAgain {
            let student: Student = Constants.student
            students.append(student)
            initialStudent = students // reload initialStudent
            tableView.reloadData()
            Constants.isLoadDataAgain = false
        }
        animateTable()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return students.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath) as! StudentTableViewCell
        
        // Configure the cell...
        
        let student = students[indexPath.row]
        
        cell.lblName.text = student.name
        cell.lblID.text = student.id
        cell.lblAge.text = student.age
        cell.lblUni.text = student.university
        
        return cell
    }
    
    //show detail
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "StudentDetail") {
            // initialize new view controller and cast it as your view controller
            let studentDetailVC = segue.destination as! StudentDetailTableViewController
            if let indexPath = self.tableView.indexPathForSelectedRow{
                let student: Student
                student = students[indexPath.row]
                studentDetailVC.studentModel = student
            }
            
        }
    }
    
    //MARK: - Delete when user swipe to left
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete){
            students.remove(at: indexPath.row)
            //update table view with new data source
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    
    //MARK: - Sort when user click edit button
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        //get data in sourceIndexPath
        let currentStudent = students[sourceIndexPath.row];
        students.remove(at: sourceIndexPath.row)
        students.insert(currentStudent, at: destinationIndexPath.row)
        
    }
    
    //Animation for TableView
    func animateTable() {
        
        let cells = tableView.visibleCells
        
        let tableViewHeight = tableView.bounds.size.height
        
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
        }
        
        var delayCounter = 0
        for cell in cells {
            UIView.animate(withDuration: 0.85, delay: Double(delayCounter) * 0.05, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
            delayCounter += 1
        }
    }
    
    // UIScrollViewDelegate ( Keyboard will disable when scroll the UIView )
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
}
