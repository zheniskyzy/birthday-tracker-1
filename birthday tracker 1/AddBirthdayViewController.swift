//
//  ViewController.swift
//  birthday tracker 1
//
//  Created by Madina Olzhabek on 30.08.2023.
//

import UIKit
import CoreData


class AddBirthdayViewController: UIViewController {
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var birthdatePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        birthdatePicker.maximumDate = Date()
        // Do any additional setup after loading the view.
    }
    @IBAction func saveTapped(_ sender: UIBarButtonItem){
        print("нажата кнопка сохранения")
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let birthdate = birthdatePicker.date
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newBirthday = Birthday(context: context)
        newBirthday.firstName = firstName
        newBirthday.lastName = lastName
        newBirthday.birthdate = birthdate as Date?
        newBirthday.birthdayId = UUID().uuidString
        if let uniqueId = newBirthday.birthdayId{
            print("birthdayId:\(uniqueId)")
        }
        do{
            try context.save()
        }catch let error{
            print("ne udalos soxranit izza oshibki\(error)")
        }
        dismiss(animated: true, completion: nil)
        
    }
    @IBAction func cancelTapped(_sender: UIBarButtonItem){
        dismiss(animated: true, completion: nil)
    }

}

