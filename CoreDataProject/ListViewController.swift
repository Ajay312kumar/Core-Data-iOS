//
//  ListViewController.swift
//  CoreDataProject
//
//  Created by ajay kumar on 18/04/24.
//

import UIKit

class ListViewController: UIViewController  {
    
    @IBOutlet weak var listTableView: UITableView!
    
    var student = [Student]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        intialSetUp()
    }
    
    func intialSetUp(){
        listTableView.delegate = self
        listTableView.dataSource = self
        
        student = DatabaseHandler.sharedInstanced.getStudentData()
    }
    
}
extension ListViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return student.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listTableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as! ListTableViewCell
        
        cell.nameLabel.text = student[indexPath.row].name
        cell.addressLabel.text = student[indexPath.row].address
        cell.cityLabel.text = student[indexPath.row].city
        cell.mobileLabel.text = student[indexPath.row].mobile
        
        return cell
    }
    
}
