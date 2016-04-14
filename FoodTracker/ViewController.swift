//
//  ViewController.swift
//  FoodTracker
//
//  Created by Andrea Perazzi on 10/04/16.
//  Copyright © 2016 Andrea Perazzi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    // MARK: Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field's user input through delegate callbacks
        nameTextField.delegate = self
        
    }
    
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        // Set the mealNameLabel with the text in the text field
        mealNameLabel.text = textField.text
    }
    
    
    
    
    // MARK: Actions
    
    @IBAction func setDefaultLabelText(sender: UIButton) {
       mealNameLabel.text = "Default Text"
    }

}

