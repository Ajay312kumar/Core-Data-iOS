//
//  DatabaseHandler.swift
//  CoreDataProject
//
//  Created by ajay kumar on 18/04/24.
//

import Foundation
import CoreData
import UIKit

class DatabaseHandler{
    
   static var sharedInstanced = DatabaseHandler()
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext

    
    func save(object: [String:String]){
        let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context!) as! Student
        student.name = object["name"]
        student.address = object["address"]
        student.city = object["city"]
        student.mobile = object["mobile"]
        
        do{
            try context?.save()
        }catch{
            print ("do not save")
        }
    }
    
    
    func getStudentData() -> [Student]{
        var student = [Student]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Student")
        do{
            student = try context?.fetch(fetchRequest) as! [Student]
        }catch{
            print("can't get data")
        }
        return student
    }
}
