//
//  ViewController.swift
//  CoreDataProject
//
//  Created by ajay kumar on 18/04/24.
//

import UIKit

class ViewController: UIViewController {

    //MARK: IBOutlets
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var mobileNumberTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    //MARK: Life Cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK: Actions
    @IBAction func saveButtonAction(_ sender: UIButton) {
        let dict = ["name": nameTextField.text!, "address": addressTextField.text!, "city": cityTextField.text!, "mobile": mobileNumberTextField.text!] as [String : Any]
        DatabaseHandler.sharedInstanced.save(object: dict as! [String : String])
    }

    @IBAction func nextButtonAction(_ sender: UIButton) {
        
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ListViewController") as? ListViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
}

